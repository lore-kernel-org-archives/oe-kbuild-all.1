Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFC95111A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777538; cv=none; b=lGoTg96geIYTFmr+2hKBLQuh2zsCgK5cQlT9UPvr4rqU/E3cXhyCnIRbLcLrVMvN5/hQSDcEe75xhquHzGNxDU0M9C5hwNKLdIg9XnL6JZ35y+WI49Ys8jVi9GOPr/LVooZBPFrzfazml3xiR+MaaRMdpi65QdIf94nsT/aJQhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777538; c=relaxed/simple;
	bh=L1XPZdzXA6YvnuQnp1iQ6iqpLjipVORPWzTRf3W5atU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Dl3J5LXOlDK9ccdTKVLYj5HgZZwXkSkp7byAyiZcu3cBkygEgo5udtJgYoCZbBVUWwLHS5W9WG2BNGXL2w2akRk6m3lVtoNu7/aN8VaRGbeO7F6LqEcEKZMRI1Yl8N6Lp5H1438n6b7G+1bE5lZQZPa8Z0xfypvSJ/y8P/+I9Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIm+HlKV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIm+HlKV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790777528; x=1822313528;
  h=date:from:to:cc:subject:message-id;
  bh=L1XPZdzXA6YvnuQnp1iQ6iqpLjipVORPWzTRf3W5atU=;
  b=aIm+HlKVFjS+GEE8iBvBSVMj0frE4OmvCjMnSihkmqEQkeYv98IejoD8
   WlpN/FEm6nio1SOlkkueKQC7AM7/DulwZBWVfF5JwV1FVWe1XiC7NASap
   su8RSP2smfUd4o7AYIuO9eHdrZjqpm8suHttLd3KK6PVHJlg9gT85kPZ6
   JBYVAK3dEv1C4iozJFSiFwqIxQ8sc1HYvtYKGsBwtXYh9oI7+j7WQ2WI1
   E6bou2zdjvYttRD6p/l20VsxDW5NCQmKR+mct8R7VnLNIdhK6jQ3Y2FHB
   W6y8uj+tKOhlWVvjCW0xophj6/LLU+j8Vl+2Gioc5tfvCywyv6LOsfqZ1
   A==;
X-CSE-ConnectionGUID: YQ8FGBFkSR+XxTGlGBtdjQ==
X-CSE-MsgGUID: PINpK7BORF6ViCltUDL6ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="101679540"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="101679540"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 07:12:02 -0700
X-CSE-ConnectionGUID: ri0a1tyiQjGLZ2jG8sz4ZA==
X-CSE-MsgGUID: m3l1Ot4XS7mG2ROtP3vidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274816252"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Sep 2026 07:12:01 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBv2M-000000001tb-0PpW;
	Wed, 30 Sep 2026 14:11:58 +0000
Date: Wed, 30 Sep 2026 16:11:29 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 21/26]
 drivers/attestation/providers/sim.c:381:1: warning: the frame size of 1580
 bytes is larger than 1280 bytes
Message-ID: <202609301652.5Zcw0Oom-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 70182d901dfdf94f8f611319f5bf3f7f6f18e1da [21/26] attestation: add the simulation provider
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260930/202609301652.5Zcw0Oom-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301652.5Zcw0Oom-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301652.5Zcw0Oom-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/attestation/providers/sim.c: In function 'attestation_sim_mr_extend':
>> drivers/attestation/providers/sim.c:381:1: warning: the frame size of 1580 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     381 | }
         | ^


vim +381 drivers/attestation/providers/sim.c

   341	
   342	static int attestation_sim_mr_extend(struct attestation *att,
   343					     unsigned int mr_id,
   344					     const struct ctlv_cursor *mr_options,
   345					     const struct attestation_digest_set *values)
   346	{
   347		struct attestation_digest changed[HASH_ALGO__LAST];
   348		struct attestation_sim *sim = attestation_sim_from_att(att);
   349		struct attestation_sim_mr *mr;
   350		size_t index;
   351		int ret;
   352	
   353		ret = attestation_sim_callback_enter(sim, ATTESTATION_SIM_CB_MR_EXTEND);
   354		if (ret)
   355			return ret;
   356		guard(mutex)(&sim->hardware_lock);
   357		if (sim->notification_pending)
   358			return -EAGAIN;
   359		mr = attestation_sim_mr_lookup(sim, mr_id);
   360		if (!mr)
   361			return -ENOENT;
   362		if (values->values_count != mr->props.algorithms_count)
   363			return -EINVAL;
   364		for (index = 0; index < values->values_count; index++) {
   365			enum hash_algo algorithm = mr->values[index].algorithm;
   366			size_t length = hash_digest_size[algorithm];
   367	
   368			if (values->values[index].algorithm != algorithm)
   369				return -EINVAL;
   370			changed[index].algorithm = algorithm;
   371			ret = attestation_sim_digest(
   372				algorithm, mr->values[index].data, length,
   373				values->values[index].data, length,
   374				changed[index].data);
   375			if (ret)
   376				return ret;
   377		}
   378		memcpy(mr->values, changed,
   379		       values->values_count * sizeof(*changed));
   380		return 0;
 > 381	}
   382	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
