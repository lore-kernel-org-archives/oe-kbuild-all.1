Content-Type: multipart/mixed; boundary="===============1887687617486548704=="
MIME-Version: 1.0
From: Liang, Kan <kan.liang@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [peterz-queue:perf/core 10/10] arch/x86/events/intel/uncore_snb.c:1111:36: warning: left shift count >= width of type
Date: Mon, 10 Feb 2020 13:23:49 -0500
Message-ID: <7d121a07-658e-82dc-5a0e-ebc8e4f93486@linux.intel.com>
In-Reply-To: <20200210171542.GW302770@tassilo.jf.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1887687617486548704==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2/10/2020 12:15 PM, Andi Kleen wrote:
>>
>> +#ifdef CONFIG_PHYS_ADDR_T_64BIT
>>   	pci_read_config_dword(pdev, SNB_UNCORE_PCI_IMC_BAR_OFFSET + 4, &mch_b=
ar);
>>   	addr |=3D ((resource_size_t)mch_bar << 32);
>> +#endif
> =

> Should really have a generic helper for this.
> =

> I'm sure other drivers have the same problem.

The server uncore doesn't need to shift left 32. The warning should not =

be triggered for server uncore.

Since both server and client uncore start to support MMIO type of uncore =

unit, yes, a generic helper for mmio_init_box() looks better.
I will submit a clean up patch later.

Thanks,
Kan


--===============1887687617486548704==--

