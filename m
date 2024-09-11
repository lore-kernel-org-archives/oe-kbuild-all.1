Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0944F1AC88D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726074914; cv=none; b=OQE6fSktWr85dXtYK9J/qdqfqBghgdy/g9fDaulMAqDbouTJyexGW8nDnNgP+x4jWM6wkW5DY4qyzwqBwpgw7+s1eQJgWw6L9nSzHrfqwyVFjGB2SzJFNBQiLH9AOWBqOpJkNPAyPqkxE9HZkfIbgh5sHFJiWFKgYw/BdX7OlBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726074914; c=relaxed/simple;
	bh=14W9sIWxLUkCkWLoX76SEaH8D6Xp9ESnArpldzuG1aY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D2DhxzYWtp6OKFnKLwHONTIf1brqNKH0yWy2lcu5+VhYqzhUCbuJsgZDDl3A+xwP+ASVFXsIWIpoioa+w00j27a+GrsizJa9uhylU5EKZWOO7qj+lNWiAPvv/TzgHYgF4vayowmPt6/eSZYF1VWBXBGDg2DA34aYH8B8aVlsoUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBI4oAEU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBI4oAEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726074912; x=1757610912;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=14W9sIWxLUkCkWLoX76SEaH8D6Xp9ESnArpldzuG1aY=;
  b=dBI4oAEUIlAGHKXQ5ty9A/cKCWSxA23+BAAQnVLewfNgmU4uQb3FRvVS
   LPMTlzG9Wc18PgQGNPY7PH9+6/gurt1Z4Xe++Ysa9WPZ8pisUsBnwFadO
   le91r+Dw84IoQcHT1b03PpkTROHGxi4Ocmto6sBrq0wEMcEd5vC+SNRkZ
   VVu7o2owbhBUJyacq+6gl9eHG4n3wufnOuCULL1D6ung570vp4+6J+9ri
   VpC932KlEGUaqzWjglGPb2eLwkI5RrbgCSrboIkzOpa2qECgDusYL2+lT
   4Pk6VwXLwa9ofH92nkK4YjwLEClzKOUyfXKonip61EK0SL7vmlDYS5LBM
   w==;
X-CSE-ConnectionGUID: 0O054ThSS0yIPI9WtPLpjQ==
X-CSE-MsgGUID: nYV0GVOzSFqfSy2GjU63rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36026771"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="36026771"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 10:15:06 -0700
X-CSE-ConnectionGUID: zGGpojq+RVaWs0OINNlC2w==
X-CSE-MsgGUID: pOup2aJWR0y/ehEKQ7SjyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="67489902"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Sep 2024 10:15:04 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soQvm-0003sg-1R;
	Wed, 11 Sep 2024 17:15:02 +0000
Date: Thu, 12 Sep 2024 01:14:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Luis Henriques (SUSE)" <luis.henriques@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Theodore Ts'o <tytso@mit.edu>, Jan Kara <jack@suse.cz>
Subject: [linux-next:master 5690/11210] fs/ext4/fast_commit.c:362:21-23:
 WARNING !A || A && B is equivalent to !A || B
Message-ID: <202409120149.GdjqoVYQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   32ffa5373540a8d1c06619f52d019c6cdc948bb4
commit: ebc4b2c1ac92fc0f8bf3f5a9c285a871d5084a6b [5690/11210] ext4: fix incorrect tid assumption in ext4_fc_mark_ineligible()
config: loongarch-randconfig-r063-20240911 (https://download.01.org/0day-ci/archive/20240912/202409120149.GdjqoVYQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409120149.GdjqoVYQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ext4/fast_commit.c:362:21-23: WARNING !A || A && B is equivalent to !A || B

vim +362 fs/ext4/fast_commit.c

   332	
   333	/*
   334	 * Mark file system as fast commit ineligible, and record latest
   335	 * ineligible transaction tid. This means until the recorded
   336	 * transaction, commit operation would result in a full jbd2 commit.
   337	 */
   338	void ext4_fc_mark_ineligible(struct super_block *sb, int reason, handle_t *handle)
   339	{
   340		struct ext4_sb_info *sbi = EXT4_SB(sb);
   341		tid_t tid;
   342		bool has_transaction = true;
   343		bool is_ineligible;
   344	
   345		if (ext4_fc_disabled(sb))
   346			return;
   347	
   348		if (handle && !IS_ERR(handle))
   349			tid = handle->h_transaction->t_tid;
   350		else {
   351			read_lock(&sbi->s_journal->j_state_lock);
   352			if (sbi->s_journal->j_running_transaction)
   353				tid = sbi->s_journal->j_running_transaction->t_tid;
   354			else
   355				has_transaction = false;
   356			read_unlock(&sbi->s_journal->j_state_lock);
   357		}
   358		spin_lock(&sbi->s_fc_lock);
   359		is_ineligible = ext4_test_mount_flag(sb, EXT4_MF_FC_INELIGIBLE);
   360		if (has_transaction &&
   361		    (!is_ineligible ||
 > 362		     (is_ineligible && tid_gt(tid, sbi->s_fc_ineligible_tid))))
   363			sbi->s_fc_ineligible_tid = tid;
   364		ext4_set_mount_flag(sb, EXT4_MF_FC_INELIGIBLE);
   365		spin_unlock(&sbi->s_fc_lock);
   366		WARN_ON(reason >= EXT4_FC_REASON_MAX);
   367		sbi->s_fc_stats.fc_ineligible_reason_count[reason]++;
   368	}
   369	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
