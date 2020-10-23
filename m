Content-Type: multipart/mixed; boundary="===============1038077497468114206=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_59) is being placed in '.data..L__unnamed_59'
Date: Fri, 23 Oct 2020 11:34:08 -0700
Message-ID: <CAKwvOdnx7SFndfL8u=YPUPuPMUk5AHb1oDuoLwQiGwi=9awNHA@mail.gmail.com>
In-Reply-To: <202010231654.wZSy3ayy-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1038077497468114206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

https://github.com/ClangBuiltLinux/linux/issues/1185

On Fri, Oct 23, 2020 at 1:03 AM kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   f9893351acaecf0a414baf9942b48d5bb5c688c6
> commit: 8fb156c9ee2db94f7127c930c89917634a1a9f56 mm/page_owner: change sp=
lit_page_owner to take a count
> date:   7 days ago
> config: powerpc64-randconfig-r004-20201022 (attached as .config)
> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project ee6a=
bef5323d59b983129bf3514ef6775d1d6cd5)
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install powerpc64 cross compiling tool for clang build
>         # apt-get install binutils-powerpc64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D8fb156c9ee2db94f7127c930c89917634a1a9f56
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/=
git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout 8fb156c9ee2db94f7127c930c89917634a1a9f56
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dpowerpc64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_4) is =
being placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_20) is=
 being placed in '.data..L__unnamed_20'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_19) is=
 being placed in '.data..L__unnamed_19'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_18) is=
 being placed in '.data..L__unnamed_18'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_7) is =
being placed in '.data..L__unnamed_7'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_5) is =
being placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_9) is =
being placed in '.data..L__unnamed_9'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_16) is=
 being placed in '.data..L__unnamed_16'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_6) is =
being placed in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_12) is=
 being placed in '.data..L__unnamed_12'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_11) is=
 being placed in '.data..L__unnamed_11'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_10) is=
 being placed in '.data..L__unnamed_10'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_8) is =
being placed in '.data..L__unnamed_8'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_15) is=
 being placed in '.data..L__unnamed_15'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_14) is=
 being placed in '.data..L__unnamed_14'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_17) is=
 being placed in '.data..L__unnamed_17'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_13) is=
 being placed in '.data..L__unnamed_13'
>    ld.lld: warning: mm/built-in.a(list_lru.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(workingset.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(workingset.o):(.data..L__unnamed_2) is =
being placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(gup.o):(.data..L__unnamed_1) is being p=
laced in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(gup.o):(.data..L__unnamed_2) is being p=
laced in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(gup.o):(.data..L__unnamed_3) is being p=
laced in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(memory.o):(.data..L__unnamed_1) is bein=
g placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(memory.o):(.data..L__unnamed_2) is bein=
g placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(memory.o):(.data..L__unnamed_3) is bein=
g placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(mincore.o):(.data..L__unnamed_1) is bei=
ng placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_3) is being =
placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_2) is being =
placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_5) is being =
placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_4) is being =
placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_6) is being =
placed in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_7) is being =
placed in '.data..L__unnamed_7'
>    ld.lld: warning: mm/built-in.a(mremap.o):(.data..L__unnamed_1) is bein=
g placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(mremap.o):(.data..L__unnamed_2) is bein=
g placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(pagewalk.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(pagewalk.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(pagewalk.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(rmap.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_1) is bei=
ng placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_2) is bei=
ng placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_3) is bei=
ng placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_4) is bei=
ng placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_6) is bei=
ng placed in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_7) is bei=
ng placed in '.data..L__unnamed_7'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_8) is bei=
ng placed in '.data..L__unnamed_8'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_5) is bei=
ng placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_11) is=
 being placed in '.data..L__unnamed_11'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_13) is=
 being placed in '.data..L__unnamed_13'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_15) is=
 being placed in '.data..L__unnamed_15'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_18) is=
 being placed in '.data..L__unnamed_18'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_19) is=
 being placed in '.data..L__unnamed_19'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_20) is=
 being placed in '.data..L__unnamed_20'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_22) is=
 being placed in '.data..L__unnamed_22'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_23) is=
 being placed in '.data..L__unnamed_23'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_24) is=
 being placed in '.data..L__unnamed_24'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_21) is=
 being placed in '.data..L__unnamed_21'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_14) is=
 being placed in '.data..L__unnamed_14'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_29) is=
 being placed in '.data..L__unnamed_29'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_41) is=
 being placed in '.data..L__unnamed_41'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_42) is=
 being placed in '.data..L__unnamed_42'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_44) is=
 being placed in '.data..L__unnamed_44'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_46) is=
 being placed in '.data..L__unnamed_46'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_45) is=
 being placed in '.data..L__unnamed_45'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_39) is=
 being placed in '.data..L__unnamed_39'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_40) is=
 being placed in '.data..L__unnamed_40'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_35) is=
 being placed in '.data..L__unnamed_35'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_43) is=
 being placed in '.data..L__unnamed_43'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_37) is=
 being placed in '.data..L__unnamed_37'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_38) is=
 being placed in '.data..L__unnamed_38'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_47) is=
 being placed in '.data..L__unnamed_47'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_48) is=
 being placed in '.data..L__unnamed_48'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_2) is =
being placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_3) is =
being placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_4) is =
being placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_12) is=
 being placed in '.data..L__unnamed_12'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_9) is =
being placed in '.data..L__unnamed_9'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_5) is =
being placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_6) is =
being placed in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_7) is =
being placed in '.data..L__unnamed_7'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_10) is=
 being placed in '.data..L__unnamed_10'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_8) is =
being placed in '.data..L__unnamed_8'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_16) is=
 being placed in '.data..L__unnamed_16'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_17) is=
 being placed in '.data..L__unnamed_17'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_25) is=
 being placed in '.data..L__unnamed_25'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_26) is=
 being placed in '.data..L__unnamed_26'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_27) is=
 being placed in '.data..L__unnamed_27'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_53) is=
 being placed in '.data..L__unnamed_53'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_54) is=
 being placed in '.data..L__unnamed_54'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_51) is=
 being placed in '.data..L__unnamed_51'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_50) is=
 being placed in '.data..L__unnamed_50'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_49) is=
 being placed in '.data..L__unnamed_49'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_52) is=
 being placed in '.data..L__unnamed_52'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_55) is=
 being placed in '.data..L__unnamed_55'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_28) is=
 being placed in '.data..L__unnamed_28'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_56) is=
 being placed in '.data..L__unnamed_56'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_57) is=
 being placed in '.data..L__unnamed_57'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_58) is=
 being placed in '.data..L__unnamed_58'
> >> ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_59) is=
 being placed in '.data..L__unnamed_59'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_30) is=
 being placed in '.data..L__unnamed_30'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_31) is=
 being placed in '.data..L__unnamed_31'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_32) is=
 being placed in '.data..L__unnamed_32'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_33) is=
 being placed in '.data..L__unnamed_33'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_34) is=
 being placed in '.data..L__unnamed_34'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_36) is=
 being placed in '.data..L__unnamed_36'
>    ld.lld: warning: mm/built-in.a(shuffle.o):(.data..L__unnamed_1) is bei=
ng placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(shuffle.o):(.data..L__unnamed_2) is bei=
ng placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(shuffle.o):(.data..L__unnamed_3) is bei=
ng placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(memblock.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(memblock.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(memblock.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(dmapool.o):(.data..L__unnamed_1) is bei=
ng placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_2) is being =
placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_5) is being =
placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_6) is being =
placed in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_8) is being =
placed in '.data..L__unnamed_8'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_7) is being =
placed in '.data..L__unnamed_7'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_3) is being =
placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_4) is being =
placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(ksm.o):(.data..L__unnamed_1) is being p=
laced in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(ksm.o):(.data..L__unnamed_2) is being p=
laced in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(ksm.o):(.data..L__unnamed_3) is being p=
laced in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(page_isolation.o):(.data..L__unnamed_1)=
 is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(page_isolation.o):(.data..L__unnamed_2)=
 is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(zbud.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(early_ioremap.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(early_ioremap.o):(.data..L__unnamed_2) =
is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(cma.o):(.data..L__unnamed_1) is being p=
laced in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(cma.o):(.data..L__unnamed_2) is being p=
laced in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(cma.o):(.data..L__unnamed_6) is being p=
laced in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(frame_vector.o):(.data..L__unnamed_2) i=
s being placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(frame_vector.o):(.data..L__unnamed_4) i=
s being placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(frame_vector.o):(.data..L__unnamed_5) i=
s being placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(frame_vector.o):(.data..L__unnamed_1) i=
s being placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(frame_vector.o):(.data..L__unnamed_3) i=
s being placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(memfd.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(read_write.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(super.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(super.o):(.data..L__unnamed_2) is being=
 placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(stat.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(pipe.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(pipe.o):(.data..L__unnamed_2) is being =
placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(namei.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(select.o):(.data..L__unnamed_1) is bein=
g placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(select.o):(.data..L__unnamed_2) is bein=
g placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(dcache.o):(.data..L__unnamed_1) is bein=
g placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(inode.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(attr.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_7) is being =
placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_2) is being =
placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_6) is being =
placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_5) is being =
placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_4) is being =
placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_3) is being =
placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(namespace.o):(.data..L__unnamed_3) is b=
eing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(namespace.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(namespace.o):(.data..L__unnamed_2) is b=
eing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(namespace.o):(.data..L__unnamed_4) is b=
eing placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(namespace.o):(.data..L__unnamed_5) is b=
eing placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(libfs.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(splice.o):(.data..L__unnamed_1) is bein=
g placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(splice.o):(.data..L__unnamed_2) is bein=
g placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(nsfs.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(fs_parser.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(notify/fsnotify.o):(.data..L__unnamed_1=
) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(notify/notification.o):(.data..L__unnam=
ed_1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(notify/mark.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(notify/mark.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(notify/dnotify/dnotify.o):(.data..L__un=
named_1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(notify/inotify/inotify_user.o):(.data..=
L__unnamed_1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(anon_inodes.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(anon_inodes.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(timerfd.o):(.data..L__unnamed_1) is bei=
ng placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(timerfd.o):(.data..L__unnamed_2) is bei=
ng placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(timerfd.o):(.data..L__unnamed_3) is bei=
ng placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(timerfd.o):(.data..L__unnamed_4) is bei=
ng placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_1) is being p=
laced in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_3) is being p=
laced in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_4) is being p=
laced in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_2) is being p=
laced in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_5) is being p=
laced in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_6) is being p=
laced in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_8) is being p=
laced in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_9) is being p=
laced in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_7) is being p=
laced in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(verity/enable.o):(.data..L__unnamed_2) =
is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(verity/enable.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(verity/open.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(verity/open.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(verity/verify.o):(.data..L__unnamed_4) =
is being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(verity/verify.o):(.data..L__unnamed_3) =
is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(verity/verify.o):(.data..L__unnamed_2) =
is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(verity/verify.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(locks.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(posix_acl.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(nfs_common/grace.o):(.data..L__unnamed_=
1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(quota/dquot.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
> --
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_4) is =
being placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_20) is=
 being placed in '.data..L__unnamed_20'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_19) is=
 being placed in '.data..L__unnamed_19'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_18) is=
 being placed in '.data..L__unnamed_18'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_7) is =
being placed in '.data..L__unnamed_7'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_5) is =
being placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_9) is =
being placed in '.data..L__unnamed_9'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_16) is=
 being placed in '.data..L__unnamed_16'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_6) is =
being placed in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_12) is=
 being placed in '.data..L__unnamed_12'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_11) is=
 being placed in '.data..L__unnamed_11'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_10) is=
 being placed in '.data..L__unnamed_10'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_8) is =
being placed in '.data..L__unnamed_8'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_15) is=
 being placed in '.data..L__unnamed_15'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_14) is=
 being placed in '.data..L__unnamed_14'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_17) is=
 being placed in '.data..L__unnamed_17'
>    ld.lld: warning: mm/built-in.a(compaction.o):(.data..L__unnamed_13) is=
 being placed in '.data..L__unnamed_13'
>    ld.lld: warning: mm/built-in.a(list_lru.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(workingset.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(workingset.o):(.data..L__unnamed_2) is =
being placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(gup.o):(.data..L__unnamed_1) is being p=
laced in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(gup.o):(.data..L__unnamed_2) is being p=
laced in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(gup.o):(.data..L__unnamed_3) is being p=
laced in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(memory.o):(.data..L__unnamed_1) is bein=
g placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(memory.o):(.data..L__unnamed_2) is bein=
g placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(memory.o):(.data..L__unnamed_3) is bein=
g placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(mincore.o):(.data..L__unnamed_1) is bei=
ng placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_3) is being =
placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_2) is being =
placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_5) is being =
placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_4) is being =
placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_6) is being =
placed in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(mmap.o):(.data..L__unnamed_7) is being =
placed in '.data..L__unnamed_7'
>    ld.lld: warning: mm/built-in.a(mremap.o):(.data..L__unnamed_1) is bein=
g placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(mremap.o):(.data..L__unnamed_2) is bein=
g placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(pagewalk.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(pagewalk.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(pagewalk.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(rmap.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_1) is bei=
ng placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_2) is bei=
ng placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_3) is bei=
ng placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_4) is bei=
ng placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_6) is bei=
ng placed in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_7) is bei=
ng placed in '.data..L__unnamed_7'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_8) is bei=
ng placed in '.data..L__unnamed_8'
>    ld.lld: warning: mm/built-in.a(vmalloc.o):(.data..L__unnamed_5) is bei=
ng placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_11) is=
 being placed in '.data..L__unnamed_11'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_13) is=
 being placed in '.data..L__unnamed_13'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_15) is=
 being placed in '.data..L__unnamed_15'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_18) is=
 being placed in '.data..L__unnamed_18'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_19) is=
 being placed in '.data..L__unnamed_19'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_20) is=
 being placed in '.data..L__unnamed_20'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_22) is=
 being placed in '.data..L__unnamed_22'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_23) is=
 being placed in '.data..L__unnamed_23'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_24) is=
 being placed in '.data..L__unnamed_24'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_21) is=
 being placed in '.data..L__unnamed_21'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_14) is=
 being placed in '.data..L__unnamed_14'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_29) is=
 being placed in '.data..L__unnamed_29'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_41) is=
 being placed in '.data..L__unnamed_41'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_42) is=
 being placed in '.data..L__unnamed_42'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_44) is=
 being placed in '.data..L__unnamed_44'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_46) is=
 being placed in '.data..L__unnamed_46'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_45) is=
 being placed in '.data..L__unnamed_45'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_39) is=
 being placed in '.data..L__unnamed_39'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_40) is=
 being placed in '.data..L__unnamed_40'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_35) is=
 being placed in '.data..L__unnamed_35'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_43) is=
 being placed in '.data..L__unnamed_43'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_37) is=
 being placed in '.data..L__unnamed_37'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_38) is=
 being placed in '.data..L__unnamed_38'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_47) is=
 being placed in '.data..L__unnamed_47'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_48) is=
 being placed in '.data..L__unnamed_48'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_2) is =
being placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_3) is =
being placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_4) is =
being placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_12) is=
 being placed in '.data..L__unnamed_12'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_9) is =
being placed in '.data..L__unnamed_9'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_5) is =
being placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_6) is =
being placed in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_7) is =
being placed in '.data..L__unnamed_7'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_10) is=
 being placed in '.data..L__unnamed_10'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_8) is =
being placed in '.data..L__unnamed_8'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_16) is=
 being placed in '.data..L__unnamed_16'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_17) is=
 being placed in '.data..L__unnamed_17'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_25) is=
 being placed in '.data..L__unnamed_25'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_26) is=
 being placed in '.data..L__unnamed_26'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_27) is=
 being placed in '.data..L__unnamed_27'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_53) is=
 being placed in '.data..L__unnamed_53'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_54) is=
 being placed in '.data..L__unnamed_54'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_51) is=
 being placed in '.data..L__unnamed_51'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_50) is=
 being placed in '.data..L__unnamed_50'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_49) is=
 being placed in '.data..L__unnamed_49'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_52) is=
 being placed in '.data..L__unnamed_52'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_55) is=
 being placed in '.data..L__unnamed_55'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_28) is=
 being placed in '.data..L__unnamed_28'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_56) is=
 being placed in '.data..L__unnamed_56'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_57) is=
 being placed in '.data..L__unnamed_57'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_58) is=
 being placed in '.data..L__unnamed_58'
> >> ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_59) is=
 being placed in '.data..L__unnamed_59'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_30) is=
 being placed in '.data..L__unnamed_30'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_31) is=
 being placed in '.data..L__unnamed_31'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_32) is=
 being placed in '.data..L__unnamed_32'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_33) is=
 being placed in '.data..L__unnamed_33'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_34) is=
 being placed in '.data..L__unnamed_34'
>    ld.lld: warning: mm/built-in.a(page_alloc.o):(.data..L__unnamed_36) is=
 being placed in '.data..L__unnamed_36'
>    ld.lld: warning: mm/built-in.a(shuffle.o):(.data..L__unnamed_1) is bei=
ng placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(shuffle.o):(.data..L__unnamed_2) is bei=
ng placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(shuffle.o):(.data..L__unnamed_3) is bei=
ng placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(memblock.o):(.data..L__unnamed_1) is be=
ing placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(memblock.o):(.data..L__unnamed_3) is be=
ing placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(memblock.o):(.data..L__unnamed_2) is be=
ing placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(dmapool.o):(.data..L__unnamed_1) is bei=
ng placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_2) is being =
placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_5) is being =
placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_6) is being =
placed in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_8) is being =
placed in '.data..L__unnamed_8'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_7) is being =
placed in '.data..L__unnamed_7'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_3) is being =
placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(slob.o):(.data..L__unnamed_4) is being =
placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(ksm.o):(.data..L__unnamed_1) is being p=
laced in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(ksm.o):(.data..L__unnamed_2) is being p=
laced in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(ksm.o):(.data..L__unnamed_3) is being p=
laced in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(page_isolation.o):(.data..L__unnamed_1)=
 is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(page_isolation.o):(.data..L__unnamed_2)=
 is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(zbud.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(early_ioremap.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(early_ioremap.o):(.data..L__unnamed_2) =
is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(cma.o):(.data..L__unnamed_1) is being p=
laced in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(cma.o):(.data..L__unnamed_2) is being p=
laced in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(cma.o):(.data..L__unnamed_6) is being p=
laced in '.data..L__unnamed_6'
>    ld.lld: warning: mm/built-in.a(frame_vector.o):(.data..L__unnamed_2) i=
s being placed in '.data..L__unnamed_2'
>    ld.lld: warning: mm/built-in.a(frame_vector.o):(.data..L__unnamed_4) i=
s being placed in '.data..L__unnamed_4'
>    ld.lld: warning: mm/built-in.a(frame_vector.o):(.data..L__unnamed_5) i=
s being placed in '.data..L__unnamed_5'
>    ld.lld: warning: mm/built-in.a(frame_vector.o):(.data..L__unnamed_1) i=
s being placed in '.data..L__unnamed_1'
>    ld.lld: warning: mm/built-in.a(frame_vector.o):(.data..L__unnamed_3) i=
s being placed in '.data..L__unnamed_3'
>    ld.lld: warning: mm/built-in.a(memfd.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(read_write.o):(.data..L__unnamed_1) is =
being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(super.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(super.o):(.data..L__unnamed_2) is being=
 placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(stat.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(pipe.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(pipe.o):(.data..L__unnamed_2) is being =
placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(namei.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(select.o):(.data..L__unnamed_1) is bein=
g placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(select.o):(.data..L__unnamed_2) is bein=
g placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(dcache.o):(.data..L__unnamed_1) is bein=
g placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(inode.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(attr.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_7) is being =
placed in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_2) is being =
placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_6) is being =
placed in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_5) is being =
placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_4) is being =
placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(file.o):(.data..L__unnamed_3) is being =
placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(namespace.o):(.data..L__unnamed_3) is b=
eing placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(namespace.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(namespace.o):(.data..L__unnamed_2) is b=
eing placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(namespace.o):(.data..L__unnamed_4) is b=
eing placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(namespace.o):(.data..L__unnamed_5) is b=
eing placed in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(libfs.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(splice.o):(.data..L__unnamed_1) is bein=
g placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(splice.o):(.data..L__unnamed_2) is bein=
g placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(nsfs.o):(.data..L__unnamed_1) is being =
placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(fs_parser.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(notify/fsnotify.o):(.data..L__unnamed_1=
) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(notify/notification.o):(.data..L__unnam=
ed_1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(notify/mark.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(notify/mark.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(notify/dnotify/dnotify.o):(.data..L__un=
named_1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(notify/inotify/inotify_user.o):(.data..=
L__unnamed_1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(anon_inodes.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(anon_inodes.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(timerfd.o):(.data..L__unnamed_1) is bei=
ng placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(timerfd.o):(.data..L__unnamed_2) is bei=
ng placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(timerfd.o):(.data..L__unnamed_3) is bei=
ng placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(timerfd.o):(.data..L__unnamed_4) is bei=
ng placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_1) is being p=
laced in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_3) is being p=
laced in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_4) is being p=
laced in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_2) is being p=
laced in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_5) is being p=
laced in '.data..L__unnamed_5'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_6) is being p=
laced in '.data..L__unnamed_6'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_8) is being p=
laced in '.data..L__unnamed_8'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_9) is being p=
laced in '.data..L__unnamed_9'
>    ld.lld: warning: fs/built-in.a(aio.o):(.data..L__unnamed_7) is being p=
laced in '.data..L__unnamed_7'
>    ld.lld: warning: fs/built-in.a(verity/enable.o):(.data..L__unnamed_2) =
is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(verity/enable.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(verity/open.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(verity/open.o):(.data..L__unnamed_1) is=
 being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(verity/verify.o):(.data..L__unnamed_4) =
is being placed in '.data..L__unnamed_4'
>    ld.lld: warning: fs/built-in.a(verity/verify.o):(.data..L__unnamed_3) =
is being placed in '.data..L__unnamed_3'
>    ld.lld: warning: fs/built-in.a(verity/verify.o):(.data..L__unnamed_2) =
is being placed in '.data..L__unnamed_2'
>    ld.lld: warning: fs/built-in.a(verity/verify.o):(.data..L__unnamed_1) =
is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(locks.o):(.data..L__unnamed_1) is being=
 placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(posix_acl.o):(.data..L__unnamed_1) is b=
eing placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(nfs_common/grace.o):(.data..L__unnamed_=
1) is being placed in '.data..L__unnamed_1'
>    ld.lld: warning: fs/built-in.a(quota/dquot.o):(.data..L__unnamed_2) is=
 being placed in '.data..L__unnamed_2'
> ..
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/202010231654.wZSy3ayy-lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============1038077497468114206==--

