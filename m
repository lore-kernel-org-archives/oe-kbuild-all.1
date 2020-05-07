Content-Type: multipart/mixed; boundary="===============2865177699907726741=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v5 02/11] qla2xxx: Suppress two recently introduced compiler warnings
Date: Thu, 07 May 2020 15:00:21 -0700
Message-ID: <CAKwvOdnuXX2xpsz6fxV-qfvj1AqN3V7qyOwtwtCG4NWq+HzfAw@mail.gmail.com>
In-Reply-To: <202005080353.y49Uwj18%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2865177699907726741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2020 at 12:18 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Bart,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on scsi/for-next]
> [also build test ERROR on mkp-scsi/for-next tip/perf/core v5.7-rc4 next-2=
0200507]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
>
> url:    https://github.com/0day-ci/linux/commits/Bart-Van-Assche/Fix-qla2=
xxx-endianness-annotations/20200507-135245
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for=
-next
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 54b3=
5c066417d4856e9d53313f7e98b354274584)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
> >> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsugg=
est-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>                                   ^

Hi Bart,
These compiler specific pragma's are not toolchain portable.  You'll
need to wrap them in:
#ifndef __clang__
preprocessor macros, or I think we have a pragma helper in tree that
helps with compiler specific pragmas.  IIRC it uses _Pragma to define
pragmas in macros.

>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
>    In file included from include/trace/events/qla.h:44:
>    In file included from include/trace/define_trace.h:95:
> >> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsugg=
est-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>                                   ^
>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
>    In file included from include/trace/events/qla.h:44:
>    In file included from include/trace/define_trace.h:102:
>    In file included from include/trace/trace_events.h:155:
> >> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsugg=
est-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>                                   ^
>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
>    In file included from include/trace/events/qla.h:44:
>    In file included from include/trace/define_trace.h:102:
>    In file included from include/trace/trace_events.h:222:
> >> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsugg=
est-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>                                   ^
>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
>    In file included from include/trace/events/qla.h:44:
>    In file included from include/trace/define_trace.h:102:
>    In file included from include/trace/trace_events.h:402:
> >> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsugg=
est-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>                                   ^
>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
>    In file included from include/trace/events/qla.h:44:
>    In file included from include/trace/define_trace.h:102:
>    In file included from include/trace/trace_events.h:453:
> >> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsugg=
est-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>                                   ^
>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
>    In file included from include/trace/events/qla.h:44:
>    In file included from include/trace/define_trace.h:102:
>    In file included from include/trace/trace_events.h:533:
> >> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsugg=
est-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>                                   ^
>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
>    In file included from include/trace/events/qla.h:44:
>    In file included from include/trace/define_trace.h:102:
>    In file included from include/trace/trace_events.h:727:
> >> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsugg=
est-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>                                   ^
>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
>    In file included from include/trace/events/qla.h:44:
>    In file included from include/trace/define_trace.h:102:
>    In file included from include/trace/trace_events.h:792:
> >> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsugg=
est-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>                                   ^
>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
>    In file included from include/trace/events/qla.h:44:
>    In file included from include/trace/define_trace.h:103:
>    In file included from include/trace/perf.h:90:
> >> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsugg=
est-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>                                   ^
>    In file included from drivers/scsi/qla2xxx/qla_dbg.c:77:
>    In file included from include/trace/events/qla.h:44:
>    In file included from include/trace/define_trace.h:104:
>    In file included from include/trace/bpf_probe.h:114:
> >> include/trace/events/qla.h:13:32: error: unknown warning group '-Wsugg=
est-attribute=3Dformat', ignored [-Werror,-Wunknown-warning-option]
>    #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>                                   ^
>    11 errors generated.
>
> vim +13 include/trace/events/qla.h
>
>     11
>     12  #pragma GCC diagnostic push
>   > 13  #pragma GCC diagnostic ignored "-Wsuggest-attribute=3Dformat"
>     14
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
d/clang-built-linux/202005080353.y49Uwj18%25lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============2865177699907726741==--

