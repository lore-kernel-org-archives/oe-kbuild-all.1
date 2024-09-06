Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9581D1739
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725636272; cv=none; b=Cflv7Rd5Zmm6kywGC5kg5aZT2CcgcBUapalDT7hVSS5Cux4fVprRSW5Cn68cgZm2gF2P4mdqcadJkFA8R5n4zj6BQde2S4Wu/43H53HYRxGcu78E+RzmiutGexAhPpIv6/azMbgdjFS2lLno7CSxcMQO6Wm/pOHeM0JWYjUDu30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725636272; c=relaxed/simple;
	bh=ixtF7a/WikG1jPr2Y/DPetlcltw7Cd6zcZ5m0vVSNC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QrVMIW8rj5PbjA8rTlLdjUljd9K5BFPR+ihPXdeoJktdEkP8rwH327uLzg9ZJl1lGswxGxprNYlu/5bs/wSH+itUuZb8j33Vpx6Ob0EEdtWLapwTRqAUai3HwzluSvoid+oK8t7HnAOSPnPYvnx0Jx8Ybe0GRAnWsf+0K1SLqgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iU1n75Et; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iU1n75Et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725636270; x=1757172270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ixtF7a/WikG1jPr2Y/DPetlcltw7Cd6zcZ5m0vVSNC8=;
  b=iU1n75EtknTQr2qDzBRX8V6dX5jPVPfbICBMOzHOmrXKAzg8gK3tOliz
   hIOaVvxWlZKrwjKKuvXG4VoLUd2bnjMacq40e9jhlwO5MbWngeVxTRIX9
   j8XojqLMtSjQA1lsRriUMLi8es26dtdwj5wvJAA17v650QgWd0x0ZuaGz
   3w9sUmwUey/2/LbgMIuT/9sEpHF63zvmK3fnb+Ca+BUmGFO2N33sQoCuP
   TwvKt5zWKt39kS2Ov3yj4fKJxVxeJW/WtVv7d1CVn7RIMR4CWAehfvk2I
   Vh2sFEItjtVAVmfcCEvLu9se1F6IsUTPe4qTBhbkZ6Pyx6WnUkG/6jvGH
   w==;
X-CSE-ConnectionGUID: ir2WTwX3Qgic5Yk0p0qtNw==
X-CSE-MsgGUID: QZFiyTipRjiXMjzGcWu1pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24507955"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="24507955"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 08:24:29 -0700
X-CSE-ConnectionGUID: yPWwzGRcSje+uZSfutOjSA==
X-CSE-MsgGUID: hhA6OvIqQ3SrSTxY16i7Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="70390193"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Sep 2024 08:24:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smap0-000BPv-0m;
	Fri, 06 Sep 2024 15:24:26 +0000
Date: Fri, 6 Sep 2024 23:23:41 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/md/dm-user.c:364 bio_flags_to_user_flags() warn: unsigned
 'out' is never less than zero.
Message-ID: <202409062320.xF1M0QK3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 ANDROID: dm: dm-user: New target that proxies BIOs to userspace
date:   3 years, 9 months ago
config: i386-randconfig-141-20240906 (https://download.01.org/0day-ci/archive/20240906/202409062320.xF1M0QK3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409062320.xF1M0QK3-lkp@intel.com/

smatch warnings:
drivers/md/dm-user.c:364 bio_flags_to_user_flags() warn: unsigned 'out' is never less than zero.

vim +/out +364 drivers/md/dm-user.c

   279	
   280	static inline long bio_flags_to_user_flags(struct bio *bio)
   281	{
   282		u64 out = 0;
   283		typeof(bio->bi_opf) opf = bio->bi_opf & ~REQ_OP_MASK;
   284	
   285		if (opf & REQ_FAILFAST_DEV) {
   286			opf &= ~REQ_FAILFAST_DEV;
   287			out |= DM_USER_REQ_MAP_FLAG_FAILFAST_DEV;
   288		}
   289	
   290		if (opf & REQ_FAILFAST_TRANSPORT) {
   291			opf &= ~REQ_FAILFAST_TRANSPORT;
   292			out |= DM_USER_REQ_MAP_FLAG_FAILFAST_TRANSPORT;
   293		}
   294	
   295		if (opf & REQ_FAILFAST_DRIVER) {
   296			opf &= ~REQ_FAILFAST_DRIVER;
   297			out |= DM_USER_REQ_MAP_FLAG_FAILFAST_DRIVER;
   298		}
   299	
   300		if (opf & REQ_SYNC) {
   301			opf &= ~REQ_SYNC;
   302			out |= DM_USER_REQ_MAP_FLAG_SYNC;
   303		}
   304	
   305		if (opf & REQ_META) {
   306			opf &= ~REQ_META;
   307			out |= DM_USER_REQ_MAP_FLAG_META;
   308		}
   309	
   310		if (opf & REQ_PRIO) {
   311			opf &= ~REQ_PRIO;
   312			out |= DM_USER_REQ_MAP_FLAG_PRIO;
   313		}
   314	
   315		if (opf & REQ_NOMERGE) {
   316			opf &= ~REQ_NOMERGE;
   317			out |= DM_USER_REQ_MAP_FLAG_NOMERGE;
   318		}
   319	
   320		if (opf & REQ_IDLE) {
   321			opf &= ~REQ_IDLE;
   322			out |= DM_USER_REQ_MAP_FLAG_IDLE;
   323		}
   324	
   325		if (opf & REQ_INTEGRITY) {
   326			opf &= ~REQ_INTEGRITY;
   327			out |= DM_USER_REQ_MAP_FLAG_INTEGRITY;
   328		}
   329	
   330		if (opf & REQ_FUA) {
   331			opf &= ~REQ_FUA;
   332			out |= DM_USER_REQ_MAP_FLAG_FUA;
   333		}
   334	
   335		if (opf & REQ_PREFLUSH) {
   336			opf &= ~REQ_PREFLUSH;
   337			out |= DM_USER_REQ_MAP_FLAG_PREFLUSH;
   338		}
   339	
   340		if (opf & REQ_RAHEAD) {
   341			opf &= ~REQ_RAHEAD;
   342			out |= DM_USER_REQ_MAP_FLAG_RAHEAD;
   343		}
   344	
   345		if (opf & REQ_BACKGROUND) {
   346			opf &= ~REQ_BACKGROUND;
   347			out |= DM_USER_REQ_MAP_FLAG_BACKGROUND;
   348		}
   349	
   350		if (opf & REQ_NOWAIT) {
   351			opf &= ~REQ_NOWAIT;
   352			out |= DM_USER_REQ_MAP_FLAG_NOWAIT;
   353		}
   354	
   355		if (opf & REQ_NOUNMAP) {
   356			opf &= ~REQ_NOUNMAP;
   357			out |= DM_USER_REQ_MAP_FLAG_NOUNMAP;
   358		}
   359	
   360		if (unlikely(opf)) {
   361			pr_warn("unsupported BIO type %x\n", opf);
   362			return -EOPNOTSUPP;
   363		}
 > 364		WARN_ON(out < 0);
   365		return out;
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
