Content-Type: multipart/mixed; boundary="===============8984595302265501337=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [sashal-linux-stable:queue-4.14 33/79] Warning: ffffffff819d7465: 0f ff 49 8d ud0 -0x73(%rcx), %ecx
Date: Mon, 18 May 2020 14:39:38 +0800
Message-ID: <d663837f-1529-9677-366b-b60210c58d5d@intel.com>
In-Reply-To: <202005181429.EBaJXrLs%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8984595302265501337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/18/20 2:10 PM, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stab=
le.git queue-4.14
> head:   7a7ddea1b419e20931152e388252c661b6fca95c
> commit: aff1cb67424d5fa9b2c5c23b052b4206ad94bf98 [33/79] x86/unwind/orc: =
Fix error path for bad ORC entry type
> config: x86_64-randconfig-a013-20200517 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 135b=
877874fae96b4372c8a3fbfaa8ff44ff86e3)
> reproduce:
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install x86_64 cross compiling tool for clang build
>          # apt-get install binutils-x86-64-linux-gnu
>          git checkout aff1cb67424d5fa9b2c5c23b052b4206ad94bf98
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross A=
RCH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
>>> Warning: ffffffff819d7465: 0f ff 49 8d ud0 -0x73(%rcx),%ecx
> Warning: objdump says 4 bytes, but insn_get_length() says 2
> Warning: arch/x86/tools/test_get_len found difference at <memcpy_page_flu=
shcache>:ffffffff819d6bf0

Hi Alexander,

Sorry for the inconvenience, it's a known issue: =

https://github.com/ClangBuiltLinux/linux/issues/992

Best Regards,
Rong Chen

> --
>>> Warning: ffffffff819d7573: 0f ff 48 8d ud0 -0x73(%rax),%ecx
> Warning: objdump says 4 bytes, but insn_get_length() says 2
> Warning: arch/x86/tools/test_get_len found difference at <memcpy_page_flu=
shcache>:ffffffff819d6bf0
> --
>>> Warning: ffffffff819d77a5: 0f ff 48 8d ud0 -0x73(%rax),%ecx
> Warning: objdump says 4 bytes, but insn_get_length() says 2
> Warning: arch/x86/tools/test_get_len found difference at <memcpy_page_flu=
shcache>:ffffffff819d6bf0
> --
>>> Warning: ffffffff819d79a5: 0f ff 48 8d ud0 -0x73(%rax),%ecx
> Warning: objdump says 4 bytes, but insn_get_length() says 2
> Warning: arch/x86/tools/test_get_len found difference at <memcpy_page_flu=
shcache>:ffffffff819d6bf0
> --
>>> Warning: ffffffff819d79b7: 0f ff 48 8d ud0 -0x73(%rax),%ecx
> Warning: objdump says 4 bytes, but insn_get_length() says 2
> Warning: arch/x86/tools/test_get_len found difference at <memcpy_page_flu=
shcache>:ffffffff819d6bf0
> --
>>> Warning: ffffffff819d7a11: 0f ff 48 8d ud0 -0x73(%rax),%ecx
> Warning: objdump says 4 bytes, but insn_get_length() says 2
> Warning: arch/x86/tools/test_get_len found difference at <memcpy_page_flu=
shcache>:ffffffff819d6bf0
> --
>>> Warning: ffffffff819d72c8: 0f ff 48 8d ud0 -0x73(%rax),%ecx
> Warning: objdump says 4 bytes, but insn_get_length() says 2
> Warning: arch/x86/tools/test_get_len found difference at <memcpy_page_flu=
shcache>:ffffffff819d6bf0
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org

--===============8984595302265501337==--

