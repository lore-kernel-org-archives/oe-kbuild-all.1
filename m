Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53F34317D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 06:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747896257; cv=none; b=ARi8gOsoJjd+ir650bBX1Plw8/j5WUNtF5Ri5+LeAyG/gFR/kX6n2gBDJkn/fpDpSkJvT1c72S+jonmyyCNV0jc8wIR1udOJj8VCwu02MQvcAvTCh4rchTx54UqSxP/hc6J42BpWDnSRKlXxdi9I/39ObK6UMf3fMV+Ocwagyts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747896257; c=relaxed/simple;
	bh=Davt7Hyek2LzSD7/JdDXR8h0dqVL4Z3QWGPYALsTdc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HPwuZkXH6rxQPl0Nuy0iQStnHOTkPmLoVt9Il/NacLWy2D5hN9b+3gotiP/7LK9TaWOaA8w3KnamEx9XKYx5qyyWU3bDNOvnNQgJ6CXG6joK2+kXTUNPuCmt9kkO5Vy29TaetK6ghVeeA8n6Tx/PN+WI/Q+sGXz/MeOMsKChw6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tnj0T+e5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tnj0T+e5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747896256; x=1779432256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Davt7Hyek2LzSD7/JdDXR8h0dqVL4Z3QWGPYALsTdc8=;
  b=Tnj0T+e5C1dSZEFfGiMcCIGKd/GQVqK3p1+cYFhSmFebfFET/yHDi7h8
   2JKYJDkxOzOLTcs4j//D7AW7bIcdpDVRYphe2I5twJV0njkM/QqcgcX4L
   vazkBFjlUxcb8WvswrWhXDm8TUQa4GJjzEQcbv92o+xpmFYvddQCb9EqD
   34Za1C0s1qk6iHrEqiLIc4jjYfSjRqeibtpKN/kDnJ+06v0/eiaAM6E/a
   BZzU+u6UpqNZEXDrHkmLcSXqwLOs4ILG155JmFy9dvbIYjsK6ecAYNwcK
   h27uBEBu3bVIPJhq/1HRFHGPX28EvwciYhjL3gUkWVxzod50fqVHL4SDP
   Q==;
X-CSE-ConnectionGUID: WHRABLCMRnKGxCf0ok60cg==
X-CSE-MsgGUID: D4QAMKMlRj+Qv3PtVLjEJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49780495"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49780495"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 23:44:13 -0700
X-CSE-ConnectionGUID: TSWLVWevR2mD48USna+n0g==
X-CSE-MsgGUID: s4xGg8cOThOvRPaLYg2t8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="177605983"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 May 2025 23:44:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHzey-000P0O-2e;
	Thu, 22 May 2025 06:44:08 +0000
Date: Thu, 22 May 2025 14:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jing Zhang <jingzhangos@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:kvm-arm64/misc-6.16 7/7]
 arch/arm64/kvm/vgic/vgic-debug.c:365: warning: expecting prototype for
 vigc_its_iter_next(). Prototype was for vgic_its_iter_next() instead
Message-ID: <202505221421.KAuWlmSr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/misc-6.16
head:   30deb51a677b96f0faf20373995fe0fb4a78b8b8
commit: 30deb51a677b96f0faf20373995fe0fb4a78b8b8 [7/7] KVM: arm64: vgic-its: Add debugfs interface to expose ITS tables
config: arm64-randconfig-002-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221421.KAuWlmSr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221421.KAuWlmSr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221421.KAuWlmSr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/vgic/vgic-debug.c:365: warning: expecting prototype for vigc_its_iter_next(). Prototype was for vgic_its_iter_next() instead


vim +365 arch/arm64/kvm/vgic/vgic-debug.c

   353	
   354	/**
   355	 * vigc_its_iter_next - Advances the iterator to the next entry in the ITS tables.
   356	 * @its: The VGIC ITS structure.
   357	 * @iter: The iterator to advance.
   358	 *
   359	 * This function moves the iterator to the next ITE within the current device,
   360	 * or to the first ITE of the next device if the current ITE is the last in
   361	 * the device. If the current device is the last device, the iterator is set
   362	 * to indicate the end of iteration.
   363	 */
   364	static void vgic_its_iter_next(struct vgic_its *its, struct vgic_its_iter *iter)
 > 365	{
   366		struct its_device *dev = iter->dev;
   367		struct its_ite *ite = iter->ite;
   368	
   369		if (!ite || list_is_last(&ite->ite_list, &dev->itt_head)) {
   370			if (list_is_last(&dev->dev_list, &its->device_list)) {
   371				dev = NULL;
   372				ite = NULL;
   373			} else {
   374				dev = list_next_entry(dev, dev_list);
   375				ite = list_first_entry_or_null(&dev->itt_head,
   376							       struct its_ite,
   377							       ite_list);
   378			}
   379		} else {
   380			ite = list_next_entry(ite, ite_list);
   381		}
   382	
   383		iter->dev = dev;
   384		iter->ite = ite;
   385	}
   386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
