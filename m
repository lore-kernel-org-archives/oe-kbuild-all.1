Content-Type: multipart/mixed; boundary="===============5068327558895894923=="
MIME-Version: 1.0
From: Liang, Kan <kan.liang@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [peterz-queue:perf/core 10/10] arch/x86/events/intel/uncore_snb.c:1111:36: warning: left shift count >= width of type
Date: Mon, 10 Feb 2020 08:14:46 -0500
Message-ID: <79f649a7-4e03-59bc-d9af-3cb8cb84adab@linux.intel.com>
In-Reply-To: <20200210084727.GA14879@hirez.programming.kicks-ass.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5068327558895894923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/10/2020 3:47 AM, Peter Zijlstra wrote:
> On Sun, Feb 09, 2020 at 11:20:38AM -0500, Liang, Kan wrote:
>>
>>
>> On 2/7/2020 5:50 PM, kbuild test robot wrote:
>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.gi=
t perf/core
>>> head:   60291b1620ac0b5d07624290a0ce909a0b09863e
>>> commit: 60291b1620ac0b5d07624290a0ce909a0b09863e [10/10] perf/x86: Add =
Intel Tiger Lake uncore support
>>> config: i386-allyesconfig (attached as .config)
>>> compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
>>> reproduce:
>>>           git checkout 60291b1620ac0b5d07624290a0ce909a0b09863e
>>>           # save the attached .config to linux build tree
>>>           make ARCH=3Di386
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>
>>> All warnings (new ones prefixed by >>):
>>>
>>>      arch/x86/events/intel/uncore_snb.c: In function 'tgl_uncore_imc_fr=
eerunning_init_box':
>>>>> arch/x86/events/intel/uncore_snb.c:1111:36: warning: left shift count=
 >=3D width of type [-Wshift-count-overflow]
>>>        addr |=3D ((resource_size_t)mch_bar << 32);
>>>                                          ^~
>>>
>>
>> The patch as below should fix the warning. But I didn't do any test with=
 32
>> bit OS. I'm not sure if we still support 32 bit.
> =

> Of course we do. The compiler just told you.
> =

> Now, personally I'd _love_ it if we were to just delete the entire 32bit
> x86 code, but last time we proposed that Linus wasn't convinced to put
> it mildly.
> =

> Now, if you can get an official Intel statement that Intel no longer
> cares about 32bit, that's be awesome. But last I checked we were
> actually still selling 32bit only parts :-/
> =

>> Peter, could you please let me know if I should submit a separate patch =
to
>> fix the warning?
>>
>> diff --git a/arch/x86/events/intel/uncore_snb.c
>> b/arch/x86/events/intel/uncore_snb.c
>> index ab67b23b2106..3de1065eefc4 100644
>> --- a/arch/x86/events/intel/uncore_snb.c
>> +++ b/arch/x86/events/intel/uncore_snb.c
>> @@ -1107,8 +1107,10 @@ static void
>> tgl_uncore_imc_freerunning_init_box(struct intel_uncore_box *box)
>>   	mch_bar &=3D ~BIT(0);
>>   	addr =3D (resource_size_t)(mch_bar + TGL_UNCORE_MMIO_IMC_MEM_OFFSET *
>> pmu->pmu_idx);
>>
>> +#ifdef CONFIG_PHYS_ADDR_T_64BIT
>>   	pci_read_config_dword(pdev, SNB_UNCORE_PCI_IMC_BAR_OFFSET + 4, &mch_b=
ar);
>>   	addr |=3D ((resource_size_t)mch_bar << 32);
>> +#endif
>>
>>   	box->io_addr =3D ioremap(addr, SNB_UNCORE_PCI_IMC_MAP_SIZE);
>>   }
> =

> Let me frob that in and see what it does.
> =


Thanks. If there is anything I need to do, please let me know.

Thanks,
Kan
--===============5068327558895894923==--

