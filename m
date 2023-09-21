Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B7B18055
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 19:33:09 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-503065c4b25so2234325e87.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Sep 2023 12:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695324787; x=1695929587; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9ETENORjJD3BdXIlQEVNl80EXV3xmfXC8vbPWv5JUEE=;
        b=NPB1LKDigw3KsI6okEuddr/KmEO4o07JdhwjsEz3M1IVVpblN/TyBj0eKGSkR4fayJ
         IB3Kg/XeeRIU9FVor7//F27RuiK/NeRc3H4pYxOIpUuEf/G5GOFkcxyOmGusllh9AkXp
         qDQMr1Qj9cHfcHr3LslfDE6pUVf9ujHr7/ZNAF6pXDEChgXCS4lnLUeUiBHeXXRFDEvi
         irPK9s2Mbdg//dEl5b2ncJgD62ky0Mr0nETQGfn9QdoyjtDSEK78CdBa9UTGwrsnnRQG
         1jIOt34c03BJJUmkQGmzMutbnp0bnxmubJumoy9rr2/FrDFNxDzN1909Zl73wz0iYy9B
         jV1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695324787; x=1695929587;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ETENORjJD3BdXIlQEVNl80EXV3xmfXC8vbPWv5JUEE=;
        b=vBNj8peEIPBd2eFdUE555D6bT2B+Fa9EoJmS5f+51Kq0lVDDJuJ3DZ5BN2NlVhb0+p
         JFnntDIfYnr+VrbnCvwOnxRx97CnX9skJ6038oeAYSUT2GkXcyc4KOe9a4Jbzg2uRX3F
         v1MGjGktAwQxin/Rmq2F4uht99ogLbvhG+b2Nq1zSBvHZFeeaMcmwWVyC8G3WsKrbPqq
         MCO88H29RpzjWakyCYbf1PucWRLIC/RV4DAJuHPXwxWj38mqVeDeWkWrZC4BpKSUehWm
         dKcnoX6Uk5Q9TGACXu6mgUQ7nxeAQ0SAxVCHUpin9KPETwn+oVlCzsMLx+cK2FyJjOKw
         vzuA==
X-Gm-Message-State: AOJu0Ywi4xG/31IboRGROF+C5wCWCTDo8ZF3CPs5/als1yCI04Cm4dkn
	0ThtcZ3u0AT4/VjH3gwv0fU=
X-Google-Smtp-Source: AGHT+IF1JJ2qfAWVlu5vNDhjWgUG2Yv8wTLqMSg0GWoQ1ILCPCoEqPFu/fKr98lyEKQwzFO+stj6Dw==
X-Received: by 2002:a19:e051:0:b0:4fe:94a1:da84 with SMTP id g17-20020a19e051000000b004fe94a1da84mr4903398lfj.5.1695324786887;
        Thu, 21 Sep 2023 12:33:06 -0700 (PDT)
Received: from mobilestation ([85.26.235.28])
        by smtp.gmail.com with ESMTPSA id r27-20020ac25a5b000000b004fdd6b72bfdsm401659lfn.117.2023.09.21.12.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 12:33:06 -0700 (PDT)
Date: Thu, 21 Sep 2023 22:32:50 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Michal Simek <monstr@monstr.eu>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>, 
	James Morse <james.morse@arm.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Robert Richter <rric@kernel.org>, oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org, 
	Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Dinh Nguyen <dinguyen@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 16/20] EDAC/synopsys: Detach Zynq A05 DDRC support to
 separate driver
Message-ID: <wioy72js2tahlcyjmghpne3gbfwd53xx7bvzmg7rnsckjod7ci@6gkewkhagvom>
References: <20230920191059.28395-17-fancer.lancer@gmail.com>
 <202309211954.M7wyhXyv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309211954.M7wyhXyv-lkp@intel.com>

On Thu, Sep 21, 2023 at 07:26:04PM +0800, kernel test robot wrote:
> Hi Serge,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on v6.5]
> [also build test WARNING on next-20230921]
> [cannot apply to linus/master v6.6-rc2 v6.6-rc1]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/EDAC-synopsys-Fix-ECC-status-data-and-IRQ-disable-race-condition/20230921-031420
> base:   v6.5
> patch link:    https://lore.kernel.org/r/20230920191059.28395-17-fancer.lancer%40gmail.com
> patch subject: [PATCH v4 16/20] EDAC/synopsys: Detach Zynq A05 DDRC support to separate driver
> config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230921/202309211954.M7wyhXyv-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309211954.M7wyhXyv-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309211954.M7wyhXyv-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/edac/zynq_edac.c:194: warning: expecting prototype for handle_error(). Prototype was for zynq_handle_error() instead
> >> drivers/edac/zynq_edac.c:233: warning: expecting prototype for check_errors(). Prototype was for zynq_check_errors() instead

Hi, kind roBot.

Thanks for pointing out to the problem. I'll fix it in v5.)

-Serge(y)

> 
> 
> vim +194 drivers/edac/zynq_edac.c
> 
>    185	
>    186	/**
>    187	 * handle_error - Handle Correctable and Uncorrectable errors.
>    188	 * @mci:	EDAC memory controller instance.
>    189	 * @p:		Zynq ECC status structure.
>    190	 *
>    191	 * Handles ECC correctable and uncorrectable errors.
>    192	 */
>    193	static void zynq_handle_error(struct mem_ctl_info *mci, struct zynq_ecc_status *p)
>  > 194	{
>    195		struct zynq_edac_priv *priv = mci->pvt_info;
>    196		struct zynq_ecc_error_info *pinf;
>    197	
>    198		if (p->ce_cnt) {
>    199			pinf = &p->ceinfo;
>    200	
>    201			snprintf(priv->message, ZYNQ_EDAC_MSG_SIZE,
>    202				 "Row %d Bank %d Col %d Bit %d Data 0x%08x",
>    203				 pinf->row, pinf->bank, pinf->col,
>    204				 pinf->bitpos, pinf->data);
>    205	
>    206			edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci,
>    207					     p->ce_cnt, 0, 0, 0, 0, 0, -1,
>    208					     priv->message, "");
>    209		}
>    210	
>    211		if (p->ue_cnt) {
>    212			pinf = &p->ueinfo;
>    213	
>    214			snprintf(priv->message, ZYNQ_EDAC_MSG_SIZE,
>    215				 "Row %d Bank %d Col %d",
>    216				 pinf->row, pinf->bank, pinf->col);
>    217	
>    218			edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci,
>    219					     p->ue_cnt, 0, 0, 0, 0, 0, -1,
>    220					     priv->message, "");
>    221		}
>    222	
>    223		memset(p, 0, sizeof(*p));
>    224	}
>    225	
>    226	/**
>    227	 * check_errors - Check controller for ECC errors.
>    228	 * @mci:	EDAC memory controller instance.
>    229	 *
>    230	 * Check and post ECC errors. Called by the polling thread.
>    231	 */
>    232	static void zynq_check_errors(struct mem_ctl_info *mci)
>  > 233	{
>    234		struct zynq_edac_priv *priv = mci->pvt_info;
>    235		int status;
>    236	
>    237		status = zynq_get_error_info(priv);
>    238		if (status)
>    239			return;
>    240	
>    241		zynq_handle_error(mci, &priv->stat);
>    242	}
>    243	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
