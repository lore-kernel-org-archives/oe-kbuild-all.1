Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CEF18452E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 10:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727520074; cv=none; b=MbU42Pg7Hsew3Q72LPw4rBST60KD8fR8PJf4QRurkGGlrbV0JVWZoEkC36Rs8gPH/kNzQjSizrPHRqV1DGh7kDh4WHzuZVvsi+ZA4/bOVBRQ6CC+kRUOE/w7t0j1JfR7TGOF44z1OXp5zEmFpzx78e+gYTmxbZQwy0rh6m5KYzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727520074; c=relaxed/simple;
	bh=z2S4ZfbAaIqLojfT8tunaSNR5A9yJtzGxStWvOW67gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bGdWhvdSKOtAzHERS+lcwl3dekUtoeEhaiJdnfWOJ+xYogJRiPrV50auzIFKScPqxqllOVgkunC87NfPr4PaPuyFAIzQ5q41TmOgo3RnOAeNxgI0O4Tb3RhZuTtiaLwoOm2yaKp2rlz9mamTj+kWLgGjahKYPaEkB0tP150tPdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i1lHkncn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1lHkncn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727520073; x=1759056073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2S4ZfbAaIqLojfT8tunaSNR5A9yJtzGxStWvOW67gQ=;
  b=i1lHkncnsHy/Exrb6aMsALsUulwS6jCwm0QE9sclUlQgZdWFUPQLC01K
   czxWO0I6bsEKldJoUJ34CsMzxgLVasxRwEsrx8U+D2XzOyR9rW7ZXciZn
   HFUaSg0hPk6P1pQepwl0hLrQx+LNwJwy9KbNLlQVrMGjQngi4ecjc/5fh
   YlWSu51IskfsPV9Lqx0T0fWcbJoAp9dvnuxJHp2Vi4NF9tvY26elNsH0I
   g7PA1H7PhHbdvhkBOWifrWnNvLmxBTC9TLs8suYOw2s3/NRONGZGCvwEG
   POGAq1ducw6ViJuRHi/gOGIEnVIbpd6KJ08iG6eESV+d4CzMqMtA7ewX5
   A==;
X-CSE-ConnectionGUID: YewA3GOlSEKiiNb/A6HWuw==
X-CSE-MsgGUID: YpZB1EDsRqWngum/Z/1jOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26534708"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26534708"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 03:41:13 -0700
X-CSE-ConnectionGUID: aj7Bu4yFQTSLnkK4j3PaRA==
X-CSE-MsgGUID: PqjeGTXaRH6PtG/1Hv3JRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77574274"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 Sep 2024 03:41:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suUsv-000NBA-1p;
	Sat, 28 Sep 2024 10:41:09 +0000
Date: Sat, 28 Sep 2024 18:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 1980/5421] drivers/md/dm-user.c:364
 bio_flags_to_user_flags() warn: unsigned 'out' is never less than zero.
Message-ID: <202409281805.qXv5YEty-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   da0c10aefaf6089b483a9c679b7151dc316a36c7
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [1980/5421] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
config: x86_64-randconfig-161-20240927 (https://download.01.org/0day-ci/archive/20240928/202409281805.qXv5YEty-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281805.qXv5YEty-lkp@intel.com/

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
