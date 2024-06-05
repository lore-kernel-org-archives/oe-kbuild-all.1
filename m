Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE8029401
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 08:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717577115; cv=none; b=brxn3ziY0Z2MrBkpFTlijvYQflgT2lnNgGDP6K0zd4duYqXybZ9o/bN2IdWeb0cEQGFJuGfG/lXE4958iOYaaNu+UqFTbDQeTXRuof96rI4dKue/yXVxH0hpiGnhllr6KMXZ0oX/JeOfOSIJNWAY94iyRGm+mzWUxWjh2Iia8s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717577115; c=relaxed/simple;
	bh=Tri52fe72haqIK4r3uQ6kkbFMfumxzU1aZm5bRKzy2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d4gPLh83srQLH/IDxWEeKwSPCNltVoTplrYL6qCM264vqeCk7a8jpsqXo6u2ShxJqJF6jd+9rb642AF0P3YxLik8iSTGNK76P6vq2bim1s766jlhyH6qTJpLjGBxZvjPleuhlmw5jOcB3c4RHCfmsKwWTV66AcpdabHJ0aS3sA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q7Fmmq/v; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q7Fmmq/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717577114; x=1749113114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tri52fe72haqIK4r3uQ6kkbFMfumxzU1aZm5bRKzy2E=;
  b=Q7Fmmq/vQQGsPxGue54v5JTiPzVGmiLF4lLeYTfgwE+HXDMc/xXEMj8F
   752ietNdrMCDDLLezcdBBU/CIllgnZfKyJ6KEBo/omLjP/BsRyfLVgw9I
   Vo7CB2vjoz2C4cmjuTQmtVpgAlM3PgZ4rfjKOrMIKRkorqGmgws4fmfu4
   YQ5q1mFXT/Go31r+diPAF9TP+TWsNYe3gy+hDRnvFKhTU+dYpcH3pgXFi
   v2NjXf2Gu5sojl7WabZXlihdqirv1XWeuAv88sPH+NgM4HbJqlhYlDyLY
   ypX/LX9M58ASj94E7hbwfAST1vmLuGEl4hNxSbr2Vm7kxhBH5MKKfmLQw
   w==;
X-CSE-ConnectionGUID: wGYoP7swScCKRPfTLP6CyA==
X-CSE-MsgGUID: xe6l+HrQT6Grx8KQZiViMQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="14054447"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="14054447"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 01:45:02 -0700
X-CSE-ConnectionGUID: CESUjJRzSHOQJ0et2+YfZg==
X-CSE-MsgGUID: Ri2wJYrnQ1WBbE9++VxyVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="42062743"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jun 2024 01:45:01 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEmGQ-00019h-2s;
	Wed, 05 Jun 2024 08:44:58 +0000
Date: Wed, 5 Jun 2024 16:44:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-block:block-integrity-limits 28/28] block/blk-settings.c:637:6:
 error: redefinition of 'queue_limits_stack_integrity'
Message-ID: <202406051613.W4NXAvkG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git block-integrity-limits
head:   e079c15a03e5937f7a00b0e529fa2046deb15043
commit: e079c15a03e5937f7a00b0e529fa2046deb15043 [28/28] block: move integrity information into queue_limits
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240605/202406051613.W4NXAvkG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406051613.W4NXAvkG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406051613.W4NXAvkG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> block/blk-settings.c:637:6: error: redefinition of 'queue_limits_stack_integrity'
     637 | bool queue_limits_stack_integrity(struct queue_limits *t,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from block/blk-settings.c:9:
   include/linux/blk-integrity.h:104:20: note: previous definition of 'queue_limits_stack_integrity' with type 'bool(struct queue_limits *, struct queue_limits *)' {aka '_Bool(struct queue_limits *, struct queue_limits *)'}
     104 | static inline bool queue_limits_stack_integrity(struct queue_limits *t,
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/queue_limits_stack_integrity +637 block/blk-settings.c

   622	
   623	/**
   624	 * queue_limits_stack_integrity - stack integrity profile
   625	 * @t: target queue limits
   626	 * @b: base queue limits
   627	 *
   628	 * Check if the integrity profile in the @b can be stacked into the
   629	 * target @t.  Stacking is possible if either:
   630	 *
   631	 *   a) does not have any integrity information stacked into it yet
   632	 *   b) the integrity profile in @b is identical to the one in @t
   633	 *
   634	 * If @b can be stacked into @t, return %true.  Else return %false and clear the
   635	 * integrity information in @t.
   636	 */
 > 637	bool queue_limits_stack_integrity(struct queue_limits *t,
   638			struct queue_limits *b)
   639	{
   640		struct blk_integrity *ti = &t->integrity;
   641		struct blk_integrity *bi = &b->integrity;
   642	
   643		if (!IS_ENABLED(CONFIG_BLK_DEV_INTEGRITY))
   644			return true;
   645	
   646		if (!ti->tuple_size) {
   647			/* inherit the settings from the first underlying device */
   648			if (!(ti->flags & BLK_INTEGRITY_STACKED)) {
   649				ti->flags = BLK_INTEGRITY_DEVICE_CAPABLE |
   650					(bi->flags & BLK_INTEGRITY_REF_TAG);
   651				ti->csum_type = bi->csum_type;
   652				ti->tuple_size = bi->tuple_size;
   653				ti->pi_offset = bi->pi_offset;
   654				ti->interval_exp = bi->interval_exp;
   655				ti->tag_size = bi->tag_size;
   656				goto done;
   657			}
   658			if (!bi->tuple_size)
   659				goto done;
   660		}
   661	
   662		if (ti->tuple_size != bi->tuple_size)
   663			goto incompatible;
   664		if (ti->interval_exp != bi->interval_exp)
   665			goto incompatible;
   666		if (ti->tag_size != bi->tag_size)
   667			goto incompatible;
   668		if (ti->csum_type != bi->csum_type)
   669			goto incompatible;
   670		if ((ti->flags & BLK_INTEGRITY_REF_TAG) !=
   671		    (bi->flags & BLK_INTEGRITY_REF_TAG))
   672			goto incompatible;
   673	
   674	done:
   675		ti->flags |= BLK_INTEGRITY_STACKED;
   676		return true;
   677	
   678	incompatible:
   679		memset(ti, 0, sizeof(*ti));
   680		return false;
   681	}
   682	EXPORT_SYMBOL_GPL(queue_limits_stack_integrity);
   683	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
