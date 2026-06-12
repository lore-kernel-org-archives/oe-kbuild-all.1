Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E2A38F953
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 10:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260247; cv=none; b=dNBq20b7llfTUgHEpiidPeOmCHigdsX/Yp++WZ44PJUX5bQGBm2NWzz1KbZ6hzG9GCmLPhd/WTEevrrmGLBluD1lKdDIpLwecenDaug7c51qoq8fchT8dz7UreATJne8Sk9k8/TVFYfIwOPCt57MvZbzn8KQICehvhT6sTIdpF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260247; c=relaxed/simple;
	bh=v5cwcGomvSUQMzir0sDntuk3Z2EgSkEPoe/fBYaEm+M=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=MSkbdE7ikMzC0H6o+wCreep+0bhw+lEHrCUZVh6H/iP8cv92t4TfVlTE+HvxliOSkLADBU6JrAzecGl8J2msomLbzFIVRBUQfCO+NpNvfi7zus+LxgjNtf7G0QdmGv29RJz7afrjnQQ4dKKmPuYUMSvRh4Gj5lWGbuwg2+/7rWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCknGNyA; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCknGNyA"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso5375215ad.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 03:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781260246; x=1781865046; darn=lists.linux.dev;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oARqs+T9JbWNb6W4wENAtGBSBaXfYyAinTQCHjHTX1s=;
        b=fCknGNyAEOKP++71BxQU6iq08mCOxdGTTg+dWnoS4Fs8zbA+Jc/FoB68cZy4kDyE6u
         oE38/vxMg8TKydE8xsdlNHra/qkBy5GZg4cFIGjR+kW8IgXl6BRuveCo+SAPNhtFBQOV
         DZgzVTTWwW8HjxQ0xf29ZK7XO0Wo/0Oq55pY2ES8KB2XR5HQi/vFIRc9WDO3zyALmXfz
         NWcWAJBfJJViheRLwoPav6eqvjwZLceERmmg5+nOWu4OvFSKAQl7ZsWWLmtPFUz2yTMJ
         rV64zd1ll0zBDHPoST6k4PTstysFhHF5EmCz2McBD1nvK6yabiL5uRe/sxjLf1K9UO3P
         /eCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260246; x=1781865046;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oARqs+T9JbWNb6W4wENAtGBSBaXfYyAinTQCHjHTX1s=;
        b=cimqlWW8O0s2CTMQBwsDTF5TQ+sRFeLeRtcGgt4wve3RiYjW+RAP8BLKAfGHAnHAIr
         hTseT1Z0ANhPUNCsJugdtBsFWDIpSDvW6toMYzpSbXvTpwYGNIC6zzX9tN1IV3EXU0Wv
         wcIHh0SUDRX1mOmvagRJJs/CSsSY8O3JZLXfNRksvykoftUBFca++SlfvvPsFwn6nukh
         q4K/IWWFJJessQx98quUzCn27BDSEB5/v700OqwEP3PFjG/HpPON3UtYqtAxILvikNwj
         0/oAOYbTmZUIfEovaYXXVU5hcKZMLIyOGM1m/WARrcjswQDDTjSj6Ve975rpsS0jlxpI
         +imQ==
X-Gm-Message-State: AOJu0YwM6zrb/IYoUk17LlLsU8Y/EzbrKKOZGoyyLoSqxmuyN8MSZxdV
	MHqLUg5Q75TbtbWak+/O17v0luSgHv+UY6aYx7/AK+zPvK6j7NXsOjBn
X-Gm-Gg: Acq92OFXRrauj7WyN8GmRixAeGz3ghQ0ml50RIZcPnQ8i82hG2y5wWVQ0z1bkkxgkP4
	g2awuagg/R8ayJNGL/sn7r7LogKwPikYDFC4sk7hewdjZKhysS179tSUKH4g6TckKZ2n3lQlKjQ
	UtEfHfJ91XPptOSAJFSBeWEUSpbcp3vShS1J0fb+hEh+5qEfCE2McllQms3xZZIAYKnaa2BNoQg
	YstCg/rxlg7ZS1/zzygdBRLm79Y7JDZdS0NRINfMX1bxeFxSGA0H3xfkq9BL6GIbGpMmKhT3pqK
	kGAsT8eKKDR4Kq/5fwfNTunK5pjpBA0jT9LvEGsTfCm6dnpnH0lskWIQcJXxGSQkscfe3+VSrNF
	bYkPCFCZqXUUpsSybORYb5puLY3spikEfzOBafqez1lFDTClUz9JBjPa2EIxJkDOH6v2yBH5QUi
	maA7W0i7f4Dy4PZH4a6lXAoz9KeQ==
X-Received: by 2002:a17:903:3887:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2c40e0350d2mr27814135ad.0.1781260245979;
        Fri, 12 Jun 2026 03:30:45 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb50e5sm17778985ad.35.2026.06.12.03.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:30:44 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: kernel test robot <lkp@intel.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, David Hildenbrand <david@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sayali Patil <sayalip@linux.ibm.com>
Subject: Re: [PATCH v2 3/3] powerpc: Kconfig: Enable THP_SWAP on Book3S64
In-Reply-To: <202606121305.h0cxjhP2-lkp@intel.com>
Date: Fri, 12 Jun 2026 12:01:26 +0530
Message-ID: <jys4e0ch.ritesh.list@gmail.com>
References: <3abf510d24c8ef17bd5e324cccc5e03e548afade.1781170904.git.ritesh.list@gmail.com> <202606121305.h0cxjhP2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

kernel test robot <lkp@intel.com> writes:

> Hi Ritesh,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linux-review/Ritesh-Harjani-IBM/include-linux-swap-h-Remove-unused-leftovers/20260611-111124 next-20260611]
> [cannot apply to powerpc/next powerpc/fixes linus/master v7.1-rc7]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Ritesh-Harjani-IBM/mm-swap-make-SWAPFILE_CLUSTER-runtime/20260611-181121
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/3abf510d24c8ef17bd5e324cccc5e03e548afade.1781170904.git.ritesh.list%40gmail.com
> patch subject: [PATCH v2 3/3] powerpc: Kconfig: Enable THP_SWAP on Book3S64
> config: arm64-randconfig-r133-20260611 (https://download.01.org/0day-ci/archive/20260612/202606121305.h0cxjhP2-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121305.h0cxjhP2-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606121305.h0cxjhP2-lkp@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>>> mm/swapfile.c:133:6: sparse: sparse: symbol 'swap_table_use_page' was not declared. Should it be static?
>
> vim +/swap_table_use_page +133 mm/swapfile.c
>
>    131	
>    132	unsigned int swap_slots_in_cluster __read_mostly;
>  > 133	bool swap_table_use_page __read_mostly;
>    134	

I had noticed this after sending the v2. But by then it was late.
Good that the sparse checker caught it.

So, I will declare this variable as static - that should fix the
sparse warning. I will spin a v3 in sometime with this fixed.

-ritesh
