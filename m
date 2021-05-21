Content-Type: multipart/mixed; boundary="===============8926531778480130023=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [android-goldfish:android-3.18 396/1051] block/blk-throttle.c:956:9-10: WARNING: return of 0/1 in function 'tg_may_dispatch' with return type bool
Date: Fri, 21 May 2021 15:03:50 +0800
Message-ID: <7d64f319-37f9-ecf6-40d3-6d2e36d32639@intel.com>
In-Reply-To: <20210521065211.GN2549456@dell>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8926531778480130023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 5/21/21 2:52 PM, Lee Jones wrote:
> On Fri, 21 May 2021, kernel test robot wrote:
>
>> Hi Lee,
>>
>> First bad commit (maybe !=3D root cause):
>>
>> tree:   https://android.googlesource.com/kernel/goldfish android-3.18
> Please ...
>
> a) I'm pretty sure I've asked for this kernel not to be tested.


Hi Lee,

Sorry for the inconvenience, we have ignored the branch in your tree:

https://github.com/intel/lkp-tests/blob/master/repo/linux/lee-linaro#L6

but another tree contains the branch too:

 =C2=A0 tree: https://android.googlesource.com/kernel/goldfish android-3.18

we'll only send the reports to the tree owner.

> b) Why have you sent me an 83 strong patch-set for a 7 year-old kernel?

the kernel was updated recently and triggered the bisections by randconfigs.

>
> Please could you make the necessary changes.

Sure, it's our fault.

Best Regards,
Rong Chen


>
>> head:   dd54b61f1458c03f68fc019b4874d98f2f0ae3a5
>> commit: 8214bf079208b146e63cd0a3ce0ed335a87ce7b3 [396/1051] scripts/dtc:=
 Export YYLOC global declaration
>> config: arc-randconfig-c023-20210520 (attached as .config)
>> compiler: arceb-elf-gcc (GCC) 9.3.0
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>>
>> cocci warnings: (new ones prefixed by >>)
>>>> block/blk-throttle.c:956:9-10: WARNING: return of 0/1 in function 'tg_=
may_dispatch' with return type bool
>>>> block/blk-throttle.c:911:8-9: WARNING: return of 0/1 in function 'tg_w=
ith_in_bps_limit' with return type bool
>>>> block/blk-throttle.c:869:8-9: WARNING: return of 0/1 in function 'tg_w=
ith_in_iops_limit' with return type bool
>>>> block/blk-throttle.c:760:8-9: WARNING: return of 0/1 in function 'thro=
tl_slice_used' with return type bool
>
>

--===============8926531778480130023==--

