Content-Type: multipart/mixed; boundary="===============5729046726878896937=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [peterz-queue:locking/irqstate 2/6] include/linux/irqflags.h:36:22: warning: declaration specifier missing, defaulting to 'int'
Date: Fri, 29 May 2020 12:11:20 +0800
Message-ID: <202005291217.imM2QEbR%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5729046726878896937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git lo=
cking/irqstate
head:   53a5109bcbaecd7ee2639bd53422eeea18b1eb2a
commit: d2706a31db9d55bf0c4c6d2c60beb02b4459805e [2/6] lockdep: Change hard=
irq{s_enabled,_context} to per-cpu variables
config: s390-randconfig-r006-20200528 (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 2d068e=
534f1671459e1b135852c1b3c10502e929)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390-linux-gnu
        git checkout d2706a31db9d55bf0c4c6d2c60beb02b4459805e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

In file included from drivers/pci/access.c:2:
In file included from include/linux/pci.h:35:
In file included from include/linux/kobject.h:20:
In file included from include/linux/sysfs.h:16:
In file included from include/linux/kernfs.h:12:
In file included from include/linux/mutex.h:16:
In file included from include/linux/spinlock_types.h:18:
In file included from include/linux/lockdep.h:23:
In file included from arch/s390/include/asm/percpu.h:5:
In file included from include/linux/preempt.h:78:
In file included from arch/s390/include/asm/preempt.h:6:
In file included from include/linux/thread_info.h:38:
In file included from arch/s390/include/asm/thread_info.h:27:
In file included from arch/s390/include/asm/processor.h:41:
>> include/linux/irqflags.h:36:22: warning: declaration specifier missing, =
defaulting to 'int'
DECLARE_PER_CPU(int, hardirqs_enabled);
^
int
include/linux/irqflags.h:36:1: warning: declaration specifier missing, defa=
ulting to 'int'
DECLARE_PER_CPU(int, hardirqs_enabled);
^
int
include/linux/irqflags.h:37:22: warning: declaration specifier missing, def=
aulting to 'int'
DECLARE_PER_CPU(int, hardirq_context);
^
int
include/linux/irqflags.h:37:1: warning: declaration specifier missing, defa=
ulting to 'int'
DECLARE_PER_CPU(int, hardirq_context);
^
int
In file included from drivers/pci/access.c:2:
In file included from include/linux/pci.h:39:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:466:31: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __raw_readb(PCI_IOBASE + addr);
~~~~~~~~~~ ^
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:105:32: note: expanded from macro '__swab16'
(__builtin_constant_p((__u16)(x)) ?                                        =
      ^
In file included from drivers/pci/access.c:2:
In file included from include/linux/pci.h:39:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:106:21: note: expanded from macro '__swab16'
___constant_swab16(x) :                                               ^
include/uapi/linux/swab.h:15:12: note: expanded from macro '___constant_swa=
b16'
(((__u16)(x) & (__u16)0x00ffU) << 8) |                                     =
  ^
In file included from drivers/pci/access.c:2:
In file included from include/linux/pci.h:39:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:106:21: note: expanded from macro '__swab16'
___constant_swab16(x) :                                               ^
include/uapi/linux/swab.h:16:12: note: expanded from macro '___constant_swa=
b16'
(((__u16)(x) & (__u16)0xff00U) >> 8)))
^
In file included from drivers/pci/access.c:2:
In file included from include/linux/pci.h:39:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:107:12: note: expanded from macro '__swab16'
__fswab16(x))
^
In file included from drivers/pci/access.c:2:
In file included from include/linux/pci.h:39:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro =
'__le32_to_cpu'
#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
^
include/uapi/linux/swab.h:118:32: note: expanded from macro '__swab32'
(__builtin_constant_p((__u32)(x)) ?                                        =
      ^
In file included from drivers/pci/access.c:2:
In file included from include/linux/pci.h:39:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro =
'__le32_to_cpu'
#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
^
include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
--
In file included from drivers/iio/chemical/bme680_core.c:11:
In file included from include/linux/acpi.h:13:
In file included from include/linux/irqdomain.h:35:
In file included from include/linux/of.h:17:
In file included from include/linux/kobject.h:20:
In file included from include/linux/sysfs.h:16:
In file included from include/linux/kernfs.h:12:
In file included from include/linux/mutex.h:16:
In file included from include/linux/spinlock_types.h:18:
In file included from include/linux/lockdep.h:23:
In file included from arch/s390/include/asm/percpu.h:5:
In file included from include/linux/preempt.h:78:
In file included from arch/s390/include/asm/preempt.h:6:
In file included from include/linux/thread_info.h:38:
In file included from arch/s390/include/asm/thread_info.h:27:
In file included from arch/s390/include/asm/processor.h:41:
>> include/linux/irqflags.h:36:22: warning: declaration specifier missing, =
defaulting to 'int'
DECLARE_PER_CPU(int, hardirqs_enabled);
^
int
include/linux/irqflags.h:36:1: warning: declaration specifier missing, defa=
ulting to 'int'
DECLARE_PER_CPU(int, hardirqs_enabled);
^
int
include/linux/irqflags.h:37:22: warning: declaration specifier missing, def=
aulting to 'int'
DECLARE_PER_CPU(int, hardirq_context);
^
int
include/linux/irqflags.h:37:1: warning: declaration specifier missing, defa=
ulting to 'int'
DECLARE_PER_CPU(int, hardirq_context);
^
int
4 warnings generated.
--
In file included from drivers/iio/chemical/bme680_i2c.c:14:
In file included from include/linux/acpi.h:13:
In file included from include/linux/irqdomain.h:35:
In file included from include/linux/of.h:17:
In file included from include/linux/kobject.h:20:
In file included from include/linux/sysfs.h:16:
In file included from include/linux/kernfs.h:12:
In file included from include/linux/mutex.h:16:
In file included from include/linux/spinlock_types.h:18:
In file included from include/linux/lockdep.h:23:
In file included from arch/s390/include/asm/percpu.h:5:
In file included from include/linux/preempt.h:78:
In file included from arch/s390/include/asm/preempt.h:6:
In file included from include/linux/thread_info.h:38:
In file included from arch/s390/include/asm/thread_info.h:27:
In file included from arch/s390/include/asm/processor.h:41:
>> include/linux/irqflags.h:36:22: warning: declaration specifier missing, =
defaulting to 'int'
DECLARE_PER_CPU(int, hardirqs_enabled);
^
int
include/linux/irqflags.h:36:1: warning: declaration specifier missing, defa=
ulting to 'int'
DECLARE_PER_CPU(int, hardirqs_enabled);
^
int
include/linux/irqflags.h:37:22: warning: declaration specifier missing, def=
aulting to 'int'
DECLARE_PER_CPU(int, hardirq_context);
^
int
include/linux/irqflags.h:37:1: warning: declaration specifier missing, defa=
ulting to 'int'
DECLARE_PER_CPU(int, hardirq_context);
^
int
drivers/iio/chemical/bme680_i2c.c:46:36: warning: unused variable 'bme680_a=
cpi_match' [-Wunused-const-variable]
static const struct acpi_device_id bme680_acpi_match[] =3D {
^
5 warnings generated.
--
In file included from drivers/iio/dac/ad5593r.c:9:
In file included from drivers/iio/dac/ad5592r-base.h:14:
In file included from include/linux/mutex.h:16:
In file included from include/linux/spinlock_types.h:18:
In file included from include/linux/lockdep.h:23:
In file included from arch/s390/include/asm/percpu.h:5:
In file included from include/linux/preempt.h:78:
In file included from arch/s390/include/asm/preempt.h:6:
In file included from include/linux/thread_info.h:38:
In file included from arch/s390/include/asm/thread_info.h:27:
In file included from arch/s390/include/asm/processor.h:41:
>> include/linux/irqflags.h:36:22: warning: declaration specifier missing, =
defaulting to 'int'
DECLARE_PER_CPU(int, hardirqs_enabled);
^
int
include/linux/irqflags.h:36:1: warning: declaration specifier missing, defa=
ulting to 'int'
DECLARE_PER_CPU(int, hardirqs_enabled);
^
int
include/linux/irqflags.h:37:22: warning: declaration specifier missing, def=
aulting to 'int'
DECLARE_PER_CPU(int, hardirq_context);
^
int
include/linux/irqflags.h:37:1: warning: declaration specifier missing, defa=
ulting to 'int'
DECLARE_PER_CPU(int, hardirq_context);
^
int
In file included from drivers/iio/dac/ad5593r.c:9:
In file included from drivers/iio/dac/ad5592r-base.h:15:
In file included from include/linux/gpio/driver.h:7:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:466:31: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __raw_readb(PCI_IOBASE + addr);
~~~~~~~~~~ ^
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:105:32: note: expanded from macro '__swab16'
(__builtin_constant_p((__u16)(x)) ?                                        =
      ^
In file included from drivers/iio/dac/ad5593r.c:9:
In file included from drivers/iio/dac/ad5592r-base.h:15:
In file included from include/linux/gpio/driver.h:7:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:106:21: note: expanded from macro '__swab16'
___constant_swab16(x) :                                               ^
include/uapi/linux/swab.h:15:12: note: expanded from macro '___constant_swa=
b16'
(((__u16)(x) & (__u16)0x00ffU) << 8) |                                     =
  ^
In file included from drivers/iio/dac/ad5593r.c:9:
In file included from drivers/iio/dac/ad5592r-base.h:15:
In file included from include/linux/gpio/driver.h:7:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:106:21: note: expanded from macro '__swab16'
___constant_swab16(x) :                                               ^
include/uapi/linux/swab.h:16:12: note: expanded from macro '___constant_swa=
b16'
(((__u16)(x) & (__u16)0xff00U) >> 8)))
^
In file included from drivers/iio/dac/ad5593r.c:9:
In file included from drivers/iio/dac/ad5592r-base.h:15:
In file included from include/linux/gpio/driver.h:7:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:107:12: note: expanded from macro '__swab16'
__fswab16(x))
^
In file included from drivers/iio/dac/ad5593r.c:9:
In file included from drivers/iio/dac/ad5592r-base.h:15:
In file included from include/linux/gpio/driver.h:7:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro =
'__le32_to_cpu'
#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
^
include/uapi/linux/swab.h:118:32: note: expanded from macro '__swab32'
(__builtin_constant_p((__u32)(x)) ?                                        =
      ^
In file included from drivers/iio/dac/ad5593r.c:9:
--
In file included from drivers/regulator/da9210-regulator.c:7:
In file included from include/linux/i2c.h:13:
In file included from include/linux/acpi.h:13:
In file included from include/linux/irqdomain.h:35:
In file included from include/linux/of.h:17:
In file included from include/linux/kobject.h:20:
In file included from include/linux/sysfs.h:16:
In file included from include/linux/kernfs.h:12:
In file included from include/linux/mutex.h:16:
In file included from include/linux/spinlock_types.h:18:
In file included from include/linux/lockdep.h:23:
In file included from arch/s390/include/asm/percpu.h:5:
In file included from include/linux/preempt.h:78:
In file included from arch/s390/include/asm/preempt.h:6:
In file included from include/linux/thread_info.h:38:
In file included from arch/s390/include/asm/thread_info.h:27:
In file included from arch/s390/include/asm/processor.h:41:
>> include/linux/irqflags.h:36:22: warning: declaration specifier missing, =
defaulting to 'int'
DECLARE_PER_CPU(int, hardirqs_enabled);
^
int
include/linux/irqflags.h:36:1: warning: declaration specifier missing, defa=
ulting to 'int'
DECLARE_PER_CPU(int, hardirqs_enabled);
^
int
include/linux/irqflags.h:37:22: warning: declaration specifier missing, def=
aulting to 'int'
DECLARE_PER_CPU(int, hardirq_context);
^
int
include/linux/irqflags.h:37:1: warning: declaration specifier missing, defa=
ulting to 'int'
DECLARE_PER_CPU(int, hardirq_context);
^
int
In file included from drivers/regulator/da9210-regulator.c:10:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:466:31: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __raw_readb(PCI_IOBASE + addr);
~~~~~~~~~~ ^
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:105:32: note: expanded from macro '__swab16'
(__builtin_constant_p((__u16)(x)) ?                                        =
      ^
In file included from drivers/regulator/da9210-regulator.c:10:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:106:21: note: expanded from macro '__swab16'
___constant_swab16(x) :                                               ^
include/uapi/linux/swab.h:15:12: note: expanded from macro '___constant_swa=
b16'
(((__u16)(x) & (__u16)0x00ffU) << 8) |                                     =
  ^
In file included from drivers/regulator/da9210-regulator.c:10:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:106:21: note: expanded from macro '__swab16'
___constant_swab16(x) :                                               ^
include/uapi/linux/swab.h:16:12: note: expanded from macro '___constant_swa=
b16'
(((__u16)(x) & (__u16)0xff00U) >> 8)))
^
In file included from drivers/regulator/da9210-regulator.c:10:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:479:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le16_to_cpu(__raw_readw(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro =
'__le16_to_cpu'
#define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
^
include/uapi/linux/swab.h:107:12: note: expanded from macro '__swab16'
__fswab16(x))
^
In file included from drivers/regulator/da9210-regulator.c:10:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro =
'__le32_to_cpu'
#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
^
include/uapi/linux/swab.h:118:32: note: expanded from macro '__swab32'
(__builtin_constant_p((__u32)(x)) ?                                        =
      ^
In file included from drivers/regulator/da9210-regulator.c:10:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:13:
In file included from arch/s390/include/asm/io.h:72:
include/asm-generic/io.h:492:45: warning: performing pointer arithmetic on =
a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
val =3D __le32_to_cpu(__raw_readl(PCI_IOBASE + addr));
~~~~~~~~~~ ^
include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro =
'__le32_to_cpu'
#define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
^
include/uapi/linux/swab.h:119:21: note: expanded from macro '__swab32'
..

vim +/int +36 include/linux/irqflags.h

    35	=

  > 36	DECLARE_PER_CPU(int, hardirqs_enabled);
    37	DECLARE_PER_CPU(int, hardirq_context);
    38	=

    39	  extern void trace_hardirqs_on_prepare(void);
    40	  extern void trace_hardirqs_off_prepare(void);
    41	  extern void trace_hardirqs_on(void);
    42	  extern void trace_hardirqs_off(void);
    43	# define lockdep_hardirq_context(p)	(this_cpu_read(hardirq_context))
    44	# define lockdep_softirq_context(p)	((p)->softirq_context)
    45	# define lockdep_hardirqs_enabled(p)	(this_cpu_read(hardirqs_enabled=
))
    46	# define lockdep_softirqs_enabled(p)	((p)->softirqs_enabled)
    47	# define lockdep_hardirq_enter()			\
    48	do {							\
    49		if (this_cpu_inc_return(hardirq_context) =3D=3D 1)	\
    50			current->hardirq_threaded =3D 0;		\
    51	} while (0)
    52	# define lockdep_hardirq_threaded()		\
    53	do {						\
    54		current->hardirq_threaded =3D 1;		\
    55	} while (0)
    56	# define lockdep_hardirq_exit()			\
    57	do {						\
    58		this_cpu_dec(hardirq_context);		\
    59	} while (0)
    60	# define lockdep_softirq_enter()		\
    61	do {						\
    62		current->softirq_context++;		\
    63	} while (0)
    64	# define lockdep_softirq_exit()			\
    65	do {						\
    66		current->softirq_context--;		\
    67	} while (0)
    68	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5729046726878896937==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
rlHVKCcq/Af8sHx8L6UBAA==
--===============5729046726878896937==--

