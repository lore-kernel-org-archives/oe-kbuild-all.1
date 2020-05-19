Content-Type: multipart/mixed; boundary="===============8896527191534610715=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCHv2 3/5] Input: EXC3000: add EXC80H60 and EXC80H84 support
Date: Wed, 20 May 2020 07:52:03 +0800
Message-ID: <202005200711.7Owi0jTC%lkp@intel.com>
In-Reply-To: <20200519182447.73405-4-sebastian.reichel@collabora.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8896527191534610715==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on input/next]
[also build test WARNING on v5.7-rc6 next-20200519]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Sebastian-Reichel/EXC3000-=
Updates/20200520-023207
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: openrisc-randconfig-r024-20200519 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dopenrisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

drivers/input/touchscreen/exc3000.c:48:13: error: 'SZ_4K' undeclared here (=
not in a function)
48 |   .max_xy =3D SZ_4K - 1,
|             ^~~~~
drivers/input/touchscreen/exc3000.c:52:13: error: 'SZ_16K' undeclared here =
(not in a function)
52 |   .max_xy =3D SZ_16K - 1,
|             ^~~~~~
In file included from arch/openrisc/include/asm/bitops.h:25,
from include/linux/bitops.h:29,
from drivers/input/touchscreen/exc3000.c:10:
drivers/input/touchscreen/exc3000.c: In function 'exc3000_read_frame':
drivers/input/touchscreen/exc3000.c:99:25: warning: comparison between poin=
ter and integer
99 |  if (data->info->max_xy =3D=3D SZ_16K - 1)
|                         ^~
include/linux/compiler.h:58:52: note: in definition of macro '__trace_if_va=
r'
58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __=
trace_if_value(cond))
|                                                    ^~~~
>> drivers/input/touchscreen/exc3000.c:99:2: note: in expansion of macro 'i=
f'
99 |  if (data->info->max_xy =3D=3D SZ_16K - 1)
|  ^~
drivers/input/touchscreen/exc3000.c:99:25: warning: comparison between poin=
ter and integer
99 |  if (data->info->max_xy =3D=3D SZ_16K - 1)
|                         ^~
include/linux/compiler.h:58:61: note: in definition of macro '__trace_if_va=
r'
58 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __=
trace_if_value(cond))
|                                                             ^~~~
>> drivers/input/touchscreen/exc3000.c:99:2: note: in expansion of macro 'i=
f'
99 |  if (data->info->max_xy =3D=3D SZ_16K - 1)
|  ^~
drivers/input/touchscreen/exc3000.c:99:25: warning: comparison between poin=
ter and integer
99 |  if (data->info->max_xy =3D=3D SZ_16K - 1)
|                         ^~
include/linux/compiler.h:69:3: note: in definition of macro '__trace_if_val=
ue'
69 |  (cond) ?              |   ^~~~
include/linux/compiler.h:56:28: note: in expansion of macro '__trace_if_var'
56 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) )=
 )
|                            ^~~~~~~~~~~~~~
>> drivers/input/touchscreen/exc3000.c:99:2: note: in expansion of macro 'i=
f'
99 |  if (data->info->max_xy =3D=3D SZ_16K - 1)
|  ^~

vim +/if +99 drivers/input/touchscreen/exc3000.c

  > 10	#include <linux/bitops.h>
    11	#include <linux/device.h>
    12	#include <linux/i2c.h>
    13	#include <linux/input.h>
    14	#include <linux/input/mt.h>
    15	#include <linux/input/touchscreen.h>
    16	#include <linux/interrupt.h>
    17	#include <linux/module.h>
    18	#include <linux/of.h>
    19	#include <linux/timer.h>
    20	#include <asm/unaligned.h>
    21	=

    22	#define EXC3000_NUM_SLOTS		10
    23	#define EXC3000_SLOTS_PER_FRAME		5
    24	#define EXC3000_LEN_FRAME		66
    25	#define EXC3000_LEN_POINT		10
    26	=

    27	#define EXC3000_MT1_EVENT		0x06
    28	#define EXC3000_MT2_EVENT		0x18
    29	=

    30	#define EXC3000_TIMEOUT_MS		100
    31	=

    32	static const struct i2c_device_id exc3000_id[];
    33	=

    34	struct eeti_dev_info {
    35		const char *name;
    36		int max_xy;
    37	};
    38	=

    39	enum eeti_dev_id {
    40		EETI_EXC3000,
    41		EETI_EXC80H60,
    42		EETI_EXC80H84,
    43	};
    44	=

    45	static struct eeti_dev_info exc3000_info[] =3D {
    46		[EETI_EXC3000] =3D {
    47			.name =3D "EETI EXC3000 Touch Screen",
    48			.max_xy =3D SZ_4K - 1,
    49		},
    50		[EETI_EXC80H60] =3D {
    51			.name =3D "EETI EXC80H60 Touch Screen",
    52			.max_xy =3D SZ_16K - 1,
    53		},
    54		[EETI_EXC80H84] =3D {
    55			.name =3D "EETI EXC80H84 Touch Screen",
    56			.max_xy =3D SZ_16K - 1,
    57		},
    58	};
    59	=

    60	struct exc3000_data {
    61		struct i2c_client *client;
    62		const struct eeti_dev_info *info;
    63		struct input_dev *input;
    64		struct touchscreen_properties prop;
    65		struct timer_list timer;
    66		u8 buf[2 * EXC3000_LEN_FRAME];
    67	};
    68	=

    69	static void exc3000_report_slots(struct input_dev *input,
    70					 struct touchscreen_properties *prop,
    71					 const u8 *buf, int num)
    72	{
    73		for (; num--; buf +=3D EXC3000_LEN_POINT) {
    74			if (buf[0] & BIT(0)) {
    75				input_mt_slot(input, buf[1]);
    76				input_mt_report_slot_state(input, MT_TOOL_FINGER, true);
    77				touchscreen_report_pos(input, prop,
    78						       get_unaligned_le16(buf + 2),
    79						       get_unaligned_le16(buf + 4),
    80						       true);
    81			}
    82		}
    83	}
    84	=

    85	static void exc3000_timer(struct timer_list *t)
    86	{
    87		struct exc3000_data *data =3D from_timer(data, t, timer);
    88	=

    89		input_mt_sync_frame(data->input);
    90		input_sync(data->input);
    91	}
    92	=

    93	static int exc3000_read_frame(struct exc3000_data *data, u8 *buf)
    94	{
    95		struct i2c_client *client =3D data->client;
    96		u8 expected_event =3D EXC3000_MT1_EVENT;
    97		int ret;
    98	=

  > 99		if (data->info->max_xy =3D=3D SZ_16K - 1)
   100			expected_event =3D EXC3000_MT2_EVENT;
   101	=

   102		ret =3D i2c_master_send(client, "'", 2);
   103		if (ret < 0)
   104			return ret;
   105	=

   106		if (ret !=3D 2)
   107			return -EIO;
   108	=

   109		ret =3D i2c_master_recv(client, buf, EXC3000_LEN_FRAME);
   110		if (ret < 0)
   111			return ret;
   112	=

   113		if (ret !=3D EXC3000_LEN_FRAME)
   114			return -EIO;
   115	=

   116		if (get_unaligned_le16(buf) !=3D EXC3000_LEN_FRAME)
   117			return -EINVAL;
   118	=

   119		if (buf[2] !=3D expected_event)
   120			return -EINVAL;
   121	=

   122		return 0;
   123	}
   124	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============8896527191534610715==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
JkPSGkvaAQA=
--===============8896527191534610715==--

