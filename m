Content-Type: multipart/mixed; boundary="===============5309618819335242818=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [peterz-queue:perf/core 10/10] arch/x86/events/intel/uncore_snb.c:1111:36: warning: left shift count >= width of type
Date: Mon, 10 Feb 2020 09:15:42 -0800
Message-ID: <20200210171542.GW302770@tassilo.jf.intel.com>
In-Reply-To: <78920963-7dcb-18eb-430a-a5bd13266578@linux.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5309618819335242818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> =

> +#ifdef CONFIG_PHYS_ADDR_T_64BIT
>  	pci_read_config_dword(pdev, SNB_UNCORE_PCI_IMC_BAR_OFFSET + 4, &mch_bar=
);
>  	addr |=3D ((resource_size_t)mch_bar << 32);
> +#endif

Should really have a generic helper for this.

I'm sure other drivers have the same problem.

-Andi
--===============5309618819335242818==--

