Content-Type: multipart/mixed; boundary="===============8262805949131110042=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 10/10] scsi: replace sdev->device_busy with sbitmap
Date: Fri, 14 Feb 2020 17:16:56 +0800
Message-ID: <20200214091656.GA777@ming.t460p>
In-Reply-To: <202002140428.063yIjwM%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8262805949131110042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2020 at 04:22:08AM +0800, kbuild test robot wrote:
> Hi Ming,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on scsi/for-next]
> [also build test WARNING on mkp-scsi/for-next block/for-next v5.6-rc1 nex=
t-20200213]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/Ming-Lei/scsi-tracking-d=
evice-queue-depth-via-sbitmap/20200213-215727
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for=
-next
> config: arm-allmodconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    In file included from drivers/message/fusion/mptbase.h:839:0,
>                     from drivers/message/fusion/mptsas.c:63:
>    drivers/message/fusion/mptsas.c: In function 'mptsas_send_link_status_=
event':
>    drivers/message/fusion/mptsas.c:3759:26: error: 'struct scsi_device' h=
as no member named 'device_busy'; did you mean 'device_blocked'?
>           atomic_read(&sdev->device_busy)));
>                              ^
>    drivers/message/fusion/mptdebug.h:72:3: note: in definition of macro '=
MPT_CHECK_LOGGING'
>       CMD;      \
>       ^~~
>    drivers/message/fusion/mptsas.c:3755:7: note: in expansion of macro 'd=
evtprintk'
>           devtprintk(ioc,
>           ^~~~~~~~~~
>    include/linux/compiler.h:269:22: note: in expansion of macro '__READ_O=
NCE'
>     #define READ_ONCE(x) __READ_ONCE(x, 1)
>                          ^~~~~~~~~~~
> >> arch/arm/include/asm/atomic.h:27:24: note: in expansion of macro 'READ=
_ONCE'
>     #define atomic_read(v) READ_ONCE((v)->counter)
>                            ^~~~~~~~~
>    drivers/message/fusion/mptsas.c:3759:7: note: in expansion of macro 'a=
tomic_read'
>           atomic_read(&sdev->device_busy)));
>           ^~~~~~~~~~~
>    drivers/message/fusion/mptsas.c:3759:26: error: 'struct scsi_device' h=
as no member named 'device_busy'; did you mean 'device_blocked'?
>           atomic_read(&sdev->device_busy)));
>                              ^
>    drivers/message/fusion/mptdebug.h:72:3: note: in definition of macro '=
MPT_CHECK_LOGGING'
>       CMD;      \
>       ^~~
>    drivers/message/fusion/mptsas.c:3755:7: note: in expansion of macro 'd=
evtprintk'
>           devtprintk(ioc,
>           ^~~~~~~~~~
>    include/linux/compiler.h:269:22: note: in expansion of macro '__READ_O=
NCE'
>     #define READ_ONCE(x) __READ_ONCE(x, 1)
>                          ^~~~~~~~~~~
> >> arch/arm/include/asm/atomic.h:27:24: note: in expansion of macro 'READ=
_ONCE'
>     #define atomic_read(v) READ_ONCE((v)->counter)
>                            ^~~~~~~~~
>    drivers/message/fusion/mptsas.c:3759:7: note: in expansion of macro 'a=
tomic_read'
>           atomic_read(&sdev->device_busy)));
>           ^~~~~~~~~~~
>    drivers/message/fusion/mptsas.c:3759:26: error: 'struct scsi_device' h=
as no member named 'device_busy'; did you mean 'device_blocked'?
>           atomic_read(&sdev->device_busy)));
>                              ^
>    drivers/message/fusion/mptdebug.h:72:3: note: in definition of macro '=
MPT_CHECK_LOGGING'
>       CMD;      \
>       ^~~
>    drivers/message/fusion/mptsas.c:3755:7: note: in expansion of macro 'd=
evtprintk'
>           devtprintk(ioc,
>           ^~~~~~~~~~
>    include/linux/compiler.h:269:22: note: in expansion of macro '__READ_O=
NCE'
>     #define READ_ONCE(x) __READ_ONCE(x, 1)
>                          ^~~~~~~~~~~
> >> arch/arm/include/asm/atomic.h:27:24: note: in expansion of macro 'READ=
_ONCE'
>     #define atomic_read(v) READ_ONCE((v)->counter)
>                            ^~~~~~~~~
>    drivers/message/fusion/mptsas.c:3759:7: note: in expansion of macro 'a=
tomic_read'
>           atomic_read(&sdev->device_busy)));
>           ^~~~~~~~~~~
>    drivers/message/fusion/mptsas.c:3759:26: error: 'struct scsi_device' h=
as no member named 'device_busy'; did you mean 'device_blocked'?
>           atomic_read(&sdev->device_busy)));
>                              ^
>    drivers/message/fusion/mptdebug.h:72:3: note: in definition of macro '=
MPT_CHECK_LOGGING'
>       CMD;      \
>       ^~~
>    drivers/message/fusion/mptsas.c:3755:7: note: in expansion of macro 'd=
evtprintk'
>           devtprintk(ioc,
>           ^~~~~~~~~~
>    include/linux/compiler.h:269:22: note: in expansion of macro '__READ_O=
NCE'
>     #define READ_ONCE(x) __READ_ONCE(x, 1)
>                          ^~~~~~~~~~~
> >> arch/arm/include/asm/atomic.h:27:24: note: in expansion of macro 'READ=
_ONCE'
>     #define atomic_read(v) READ_ONCE((v)->counter)
>                            ^~~~~~~~~
>    drivers/message/fusion/mptsas.c:3759:7: note: in expansion of macro 'a=
tomic_read'
>           atomic_read(&sdev->device_busy)));
>           ^~~~~~~~~~~
>    drivers/message/fusion/mptsas.c:3759:26: error: 'struct scsi_device' h=
as no member named 'device_busy'; did you mean 'device_blocked'?
>           atomic_read(&sdev->device_busy)));
>                              ^
>    drivers/message/fusion/mptdebug.h:72:3: note: in definition of macro '=
MPT_CHECK_LOGGING'
>       CMD;      \
>       ^~~
>    drivers/message/fusion/mptsas.c:3755:7: note: in expansion of macro 'd=
evtprintk'
>           devtprintk(ioc,
>           ^~~~~~~~~~
>    include/linux/compiler.h:269:22: note: in expansion of macro '__READ_O=
NCE'
>     #define READ_ONCE(x) __READ_ONCE(x, 1)
>                          ^~~~~~~~~~~
> >> arch/arm/include/asm/atomic.h:27:24: note: in expansion of macro 'READ=
_ONCE'
>     #define atomic_read(v) READ_ONCE((v)->counter)
>                            ^~~~~~~~~
>    drivers/message/fusion/mptsas.c:3759:7: note: in expansion of macro 'a=
tomic_read'
>           atomic_read(&sdev->device_busy)));
>           ^~~~~~~~~~~
> --
>    In file included from drivers/message//fusion/mptbase.h:839:0,
>                     from drivers/message//fusion/mptsas.c:63:
>    drivers/message//fusion/mptsas.c: In function 'mptsas_send_link_status=
_event':
>    drivers/message//fusion/mptsas.c:3759:26: error: 'struct scsi_device' =
has no member named 'device_busy'; did you mean 'device_blocked'?
>           atomic_read(&sdev->device_busy)));
>                              ^
>    drivers/message//fusion/mptdebug.h:72:3: note: in definition of macro =
'MPT_CHECK_LOGGING'
>       CMD;      \
>       ^~~
>    drivers/message//fusion/mptsas.c:3755:7: note: in expansion of macro '=
devtprintk'
>           devtprintk(ioc,
>           ^~~~~~~~~~
>    include/linux/compiler.h:269:22: note: in expansion of macro '__READ_O=
NCE'
>     #define READ_ONCE(x) __READ_ONCE(x, 1)
>                          ^~~~~~~~~~~
> >> arch/arm/include/asm/atomic.h:27:24: note: in expansion of macro 'READ=
_ONCE'
>     #define atomic_read(v) READ_ONCE((v)->counter)
>                            ^~~~~~~~~
>    drivers/message//fusion/mptsas.c:3759:7: note: in expansion of macro '=
atomic_read'
>           atomic_read(&sdev->device_busy)));
>           ^~~~~~~~~~~
>    drivers/message//fusion/mptsas.c:3759:26: error: 'struct scsi_device' =
has no member named 'device_busy'; did you mean 'device_blocked'?
>           atomic_read(&sdev->device_busy)));
>                              ^
>    drivers/message//fusion/mptdebug.h:72:3: note: in definition of macro =
'MPT_CHECK_LOGGING'
>       CMD;      \
>       ^~~
>    drivers/message//fusion/mptsas.c:3755:7: note: in expansion of macro '=
devtprintk'
>           devtprintk(ioc,
>           ^~~~~~~~~~
>    include/linux/compiler.h:269:22: note: in expansion of macro '__READ_O=
NCE'
>     #define READ_ONCE(x) __READ_ONCE(x, 1)
>                          ^~~~~~~~~~~
> >> arch/arm/include/asm/atomic.h:27:24: note: in expansion of macro 'READ=
_ONCE'
>     #define atomic_read(v) READ_ONCE((v)->counter)
>                            ^~~~~~~~~
>    drivers/message//fusion/mptsas.c:3759:7: note: in expansion of macro '=
atomic_read'
>           atomic_read(&sdev->device_busy)));
>           ^~~~~~~~~~~
>    drivers/message//fusion/mptsas.c:3759:26: error: 'struct scsi_device' =
has no member named 'device_busy'; did you mean 'device_blocked'?
>           atomic_read(&sdev->device_busy)));
>                              ^
>    drivers/message//fusion/mptdebug.h:72:3: note: in definition of macro =
'MPT_CHECK_LOGGING'
>       CMD;      \
>       ^~~
>    drivers/message//fusion/mptsas.c:3755:7: note: in expansion of macro '=
devtprintk'
>           devtprintk(ioc,
>           ^~~~~~~~~~
>    include/linux/compiler.h:269:22: note: in expansion of macro '__READ_O=
NCE'
>     #define READ_ONCE(x) __READ_ONCE(x, 1)
>                          ^~~~~~~~~~~
> >> arch/arm/include/asm/atomic.h:27:24: note: in expansion of macro 'READ=
_ONCE'
>     #define atomic_read(v) READ_ONCE((v)->counter)
>                            ^~~~~~~~~
>    drivers/message//fusion/mptsas.c:3759:7: note: in expansion of macro '=
atomic_read'
>           atomic_read(&sdev->device_busy)));
>           ^~~~~~~~~~~
>    drivers/message//fusion/mptsas.c:3759:26: error: 'struct scsi_device' =
has no member named 'device_busy'; did you mean 'device_blocked'?
>           atomic_read(&sdev->device_busy)));
>                              ^
>    drivers/message//fusion/mptdebug.h:72:3: note: in definition of macro =
'MPT_CHECK_LOGGING'
>       CMD;      \
>       ^~~
>    drivers/message//fusion/mptsas.c:3755:7: note: in expansion of macro '=
devtprintk'
>           devtprintk(ioc,
>           ^~~~~~~~~~
>    include/linux/compiler.h:269:22: note: in expansion of macro '__READ_O=
NCE'
>     #define READ_ONCE(x) __READ_ONCE(x, 1)
>                          ^~~~~~~~~~~
> >> arch/arm/include/asm/atomic.h:27:24: note: in expansion of macro 'READ=
_ONCE'
>     #define atomic_read(v) READ_ONCE((v)->counter)
>                            ^~~~~~~~~
>    drivers/message//fusion/mptsas.c:3759:7: note: in expansion of macro '=
atomic_read'
>           atomic_read(&sdev->device_busy)));
>           ^~~~~~~~~~~
>    drivers/message//fusion/mptsas.c:3759:26: error: 'struct scsi_device' =
has no member named 'device_busy'; did you mean 'device_blocked'?
>           atomic_read(&sdev->device_busy)));
>                              ^
>    drivers/message//fusion/mptdebug.h:72:3: note: in definition of macro =
'MPT_CHECK_LOGGING'
>       CMD;      \
>       ^~~
>    drivers/message//fusion/mptsas.c:3755:7: note: in expansion of macro '=
devtprintk'
>           devtprintk(ioc,
>           ^~~~~~~~~~
>    include/linux/compiler.h:269:22: note: in expansion of macro '__READ_O=
NCE'
>     #define READ_ONCE(x) __READ_ONCE(x, 1)
>                          ^~~~~~~~~~~
> >> arch/arm/include/asm/atomic.h:27:24: note: in expansion of macro 'READ=
_ONCE'
>     #define atomic_read(v) READ_ONCE((v)->counter)
>                            ^~~~~~~~~
>    drivers/message//fusion/mptsas.c:3759:7: note: in expansion of macro '=
atomic_read'
>           atomic_read(&sdev->device_busy)));

Hello,

Thanks for the report.

Looks miss this non-scsi directory, will fix it in V2 after getting
some feedback.


Thank,
Ming

--===============8262805949131110042==--

