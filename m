Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA7938DC46
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Aug 2026 15:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786460660; cv=none; b=pUG/Dugzi6LStH46UdMEScI+DHz5wYVZEZzIZYoB/EnaV72zctS5XDi41XmHv9p8zvOwTMBkuCIIBeaqa4N540S9hzGodtfaobsQ99SCr4I6I5hKWBi89aOQKBC+S5ZdoQjvR7jBKDtQ/RHXLTp958sSrsdndJ2ptRwmK07wIck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786460660; c=relaxed/simple;
	bh=/p4c5Vm3uBleraYwy0cpeTAKCoxvbv2SMuCQOwlj5Vw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0cyTAynfkzmghNJoyb1waSn295K9ahEXyTP/rG0OMLGKOOput5MkZ9XaJD0WEaVEwfiPOdJHKoOf08CLUWNqcTdQEcvQrvYDmTuplQMffRjDHKrifGQ90Bl74YyEYeZWqvaUmdKqzVKLwppvj/QGYk4yi6m5Aqz0zez448tlEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fahnGSGr; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fahnGSGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786460658; x=1817996658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/p4c5Vm3uBleraYwy0cpeTAKCoxvbv2SMuCQOwlj5Vw=;
  b=fahnGSGrycj/r7/NxkdTKqxnNJ0EDr4LmhYqvSVhVcLhA/zmQ3xP9PkA
   yxyjO5fYeEMWOYpJlRfgw1U/74XiVzKAEnQHDfsnoGffiTdvfUi1rCpNA
   S5TR6w9S+5uQSUOvEsinVPN/9dMmjdPueaSwLqTeSSoLOvDntZxrWv+WC
   oSklSvFpl0HeV3S3QXJUlnOojftaIR4Mk1WGKsBsf/tPt8Pa0oP3Du+n6
   I7I2hESYv/RevZIsA/VBAOvuc8G2cMt4bmW+Ulk2THICV4ShULRcivS+y
   WGbgOeimb5mxkBRE+4pnJa8fm1n556coXhTuNKV4gcoJrSGqNbBjE7+66
   A==;
X-CSE-ConnectionGUID: L3xgY5aYTO2og/4oyWjJiA==
X-CSE-MsgGUID: XpL14Z/DQV+T0ZTqgTbPmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87209072"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="87209072"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2026 08:04:14 -0700
X-CSE-ConnectionGUID: lp0vwAr3THyBz2A2t5trLQ==
X-CSE-MsgGUID: D+rn9DHIT4+qIDXvKo7Mzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
   d="scan'208";a="260040009"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Aug 2026 08:04:12 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wto1R-00000000Ot0-1h9c;
	Tue, 11 Aug 2026 15:04:09 +0000
Date: Tue, 11 Aug 2026 23:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sreeraj S Kurup <sreekuttan2156239@gmail.com>, o-takashi@sakamocchi.jp
Cc: oe-kbuild-all@lists.linux.dev, linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: Re: [PATCH] firewire: core-card: fix ROM length mismatch and
 strengthen descriptor validation
Message-ID: <202608112235.mPi5BN2l-lkp@intel.com>
References: <20260720144913.5840-1-sreekuttan2156239@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720144913.5840-1-sreekuttan2156239@gmail.com>

Hi Sreeraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ieee1394-linux1394/for-linus]
[cannot apply to ieee1394-linux1394/for-next next-20260810]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sreeraj-S-Kurup/firewire-core-card-fix-ROM-length-mismatch-and-strengthen-descriptor-validation/20260811-151106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git for-linus
patch link:    https://lore.kernel.org/r/20260720144913.5840-1-sreekuttan2156239%40gmail.com
patch subject: [PATCH] firewire: core-card: fix ROM length mismatch and strengthen descriptor validation
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260811/202608112235.mPi5BN2l-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608112235.mPi5BN2l-lkp@intel.com/

New smatch warnings:
drivers/firewire/core-card.c:146 generate_config_rom() warn: inconsistent indenting

Old smatch warnings:
drivers/firewire/core-card.c:514 bm_work() warn: always true condition '(root_node->max_hops < (16 / 1 + (0))) => (0-15 < 16)'

vim +146 drivers/firewire/core-card.c

    88	
    89	static void generate_config_rom(struct fw_card *card, __be32 *config_rom)
    90	{
    91		struct fw_descriptor *desc;
    92		int i, j, k, length;
    93	
    94		/*
    95		 * Initialize contents of config rom buffer.  On the OHCI
    96		 * controller, block reads to the config rom accesses the host
    97		 * memory, but quadlet read access the hardware bus info block
    98		 * registers.  That's just crack, but it means we should make
    99		 * sure the contents of bus info block in host memory matches
   100		 * the version stored in the OHCI registers.
   101		 */
   102	
   103		config_rom[0] = cpu_to_be32(
   104			BIB_CRC_LENGTH(4) | BIB_INFO_LENGTH(4) | BIB_CRC(0));
   105		config_rom[1] = cpu_to_be32(BIB_BUS_NAME);
   106		config_rom[2] = cpu_to_be32(
   107			BIB_LINK_SPEED(card->link_speed) |
   108			BIB_GENERATION(card->config_rom_generation++ % 14 + 2) |
   109			BIB_MAX_ROM(2) |
   110			BIB_MAX_RECEIVE(card->max_receive) |
   111			BIB_BMC | BIB_ISC | BIB_CMC | BIB_IRMC);
   112		config_rom[3] = cpu_to_be32(card->guid >> 32);
   113		config_rom[4] = cpu_to_be32(card->guid);
   114	
   115		/* Generate root directory. */
   116		config_rom[6] = cpu_to_be32(NODE_CAPABILITIES);
   117		i = 7;
   118		j = 7 + descriptor_count;
   119	
   120		/* Generate root directory entries for descriptors. */
   121		list_for_each_entry (desc, &descriptor_list, link) {
   122			if (desc->immediate > 0)
   123				config_rom[i++] = cpu_to_be32(desc->immediate);
   124			config_rom[i] = cpu_to_be32(desc->key | (j - i));
   125			i++;
   126			j += desc->length;
   127		}
   128	
   129		/* Update root directory length. */
   130		config_rom[5] = cpu_to_be32((i - 5 - 1) << 16);
   131	
   132		/* End of root directory, now copy in descriptors. */
   133		list_for_each_entry (desc, &descriptor_list, link) {
   134			for (k = 0; k < desc->length; k++)
   135				config_rom[i + k] = cpu_to_be32(desc->data[k]);
   136			i += desc->length;
   137		}
   138	
   139		/* Calculate CRCs for all blocks in the config rom.  This
   140		 * assumes that CRC length and info length are identical for
   141		 * the bus info block, which is always the case for this
   142		 * implementation. */
   143		for (i = 0; i < j; i += length + 1)
   144			length = fw_compute_block_crc(config_rom + i);
   145	
 > 146	     if (j != config_rom_length) {
   147	        pr_warn("FireWire ROM length mismatch: expected %zu, got %d\n",
   148	            config_rom_length, j);
   149	        config_rom_length = j;
   150	     }
   151	}
   152	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
