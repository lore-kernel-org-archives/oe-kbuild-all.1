Content-Type: multipart/mixed; boundary="===============1123601794043298840=="
MIME-Version: 1.0
From: Michael Ellerman <mpe@ellerman.id.au>
To: kbuild-all@lists.01.org
Subject: Re: [yyu168-linux_cet:cet 55/58] powerpc64le-linux-ld: warning: discarding dynamic section .rela___ksymtab+jiffies_to_timeval
Date: Thu, 06 Feb 2020 14:26:47 +1100
Message-ID: <87wo901jm0.fsf@mpe.ellerman.id.au>
In-Reply-To: <CAMe9rOrJEVL8Qw3fgm9FeDjwGZNxGoZ-OO6bfmV=gtK=g68cvQ@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1123601794043298840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"H.J. Lu" <hjl.tools@gmail.com> writes:
> On Tue, Feb 4, 2020 at 3:37 PM kbuild test robot <lkp@intel.com> wrote:
>>
>> tree:   https://github.com/yyu168/linux_cet.git cet
>> head:   bba707cc4715c1036b6561ab38b16747f9c49cfa
>> commit: 71bb971dd76eeacd351690f28864ad5c5bec3691 [55/58] Discard .note.g=
nu.property sections in generic NOTES
>> config: powerpc-rhel-kconfig (attached as .config)
>> compiler: powerpc64le-linux-gcc (GCC) 7.5.0
>> reproduce:
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout 71bb971dd76eeacd351690f28864ad5c5bec3691
>>         # save the attached .config to linux build tree
>>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Dpowerpc
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All warnings (new ones prefixed by >>):
>>
>>    powerpc64le-linux-ld: warning: discarding dynamic section .rela___ksy=
mtab_gpl+__wait_rcu_gp
>
> arch/powerpc/kernel/vmlinux.lds.S has
>
>  .rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
>  {
>   __rela_dyn_start =3D .;
>   *(.rela*) <<<<<<<< Keep .rela* sections
>  }

The above is inside #ifdef CONFIG_RELOCATABLE

> ...
>  /DISCARD/ : {
>   *(*.EMB.apuinfo)
>   *(.glink .iplt .plt .rela* .comment)
>                            ^^^^ Discard  .rela* sections.  But it is igno=
red.
>   *(.gnu.version*)
>   *(.gnu.attributes)
>   *(.eh_frame)
>  }

But that is not #ifdef'ed at all.

> With my
>
> ommit 71bb971dd76eeacd351690f28864ad5c5bec3691
> Author: H.J. Lu <hjl.tools@gmail.com>
> Date:   Thu Jan 30 12:39:09 2020 -0800
>
>     Discard .note.gnu.property sections in generic NOTES
>
>     With the command-line option, -mx86-used-note=3Dyes, the x86 assembler
>     in binutils 2.32 and above generates a program property note in a note
>     section, .note.gnu.property, to encode used x86 ISAs and features.  B=
ut
>     kernel linker script only contains a single NOTE segment:
>
> /DISCARD/ : { *(.note.gnu.property) }
>
> is placed before
>
> .rela.dyn : AT(ADDR(.rela.dyn) - (0xc000000000000000 -0x00000000))
>  {
>   __rela_dyn_start =3D .;
>   *(.rela*) <<<<<<<< Keep .rela* sections
>  }
>
> Then .rela* in
>
>  /DISCARD/ : {
>   *(*.EMB.apuinfo)
>   *(.glink .iplt .plt .rela* .comment)
>   *(.gnu.version*)
>   *(.gnu.attributes)
>   *(.eh_frame)
>  }
>
> is honored.  Can someone from POWERPC comment on it?

Hmm OK. I'm not really a toolchain person.

The comment on DISCARDS says:

   * Some archs want to discard exit text/data at runtime rather than
   * link time due to cross-section references such as alt instructions,
   * bug table, eh_frame, etc.  DISCARDS must be the last of output
   * section definitions so that such archs put those in earlier section
   * definitions.
   */

But I guess you're changing those semantics in your series.

This seems to fix the warning for me?

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinu=
x.lds.S
index b4c89a1acebb..076b3e8a849d 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -365,9 +365,12 @@ SECTIONS
 	DISCARDS
 	/DISCARD/ : {
 		*(*.EMB.apuinfo)
-		*(.glink .iplt .plt .rela* .comment)
+		*(.glink .iplt .plt .comment)
 		*(.gnu.version*)
 		*(.gnu.attributes)
 		*(.eh_frame)
+#ifndef CONFIG_RELOCATABLE
+		*(.rela*)
+#endif
 	}
 }


cheers
--===============1123601794043298840==--

