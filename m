Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF7437189C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 11:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769483; cv=none; b=syL3qiZAdO/p4aoUsK2p6l4ygcgVRa1cq77IP1Lt90U1h4iRlMfliYeMo4GZ3FB7IKDASAKjnJJ/xAD91WLUQR/RJ5Bfbarn0bnIKFh5h8Kht/FnHwt00zx6eX87sRJlmITMRHhxGPf/Y0PQx4Mum4LFKJ4rk1ioZputM83e9IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769483; c=relaxed/simple;
	bh=3PEJ139VMddKOhoOitnOz09QKKLqv/8BJXxA6irrfFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tp7WD9+rVMHmC4d/+gqdFGrvWqUPB+MF2whsNIGXJfCK4oHaj/CvxvkTKD44SXoDlSzM4czp7kplfO0mOXLsVSWjqtFTA5RRCcAXISYduPAqX1vtaFD632B9ipC0fwJVMI4KOaApmS6l3eMiSV4W9bR4A4RpEf89aJEtpoczD4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IpPn0030; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpPn0030"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790769481; x=1822305481;
  h=date:from:to:cc:subject:message-id;
  bh=3PEJ139VMddKOhoOitnOz09QKKLqv/8BJXxA6irrfFA=;
  b=IpPn0030ZeT28VJC8dzAkyQsu4xliOQeqCwVvJLiD6DriAVgjnsN4nFO
   qQoiuQfMC0LPjjUM8kOKwnPXVlWQC9GiKd8jS++jI/RN1kqw1Y9TI2YEv
   EHuvXjSIcc+4eklCkhlZbiLzZ0LSB6esCcOYlx+wKav8kPSSv/B1rMvmP
   Hh6ybMmXXKmU0tovp3jT9talsSEVeMDvosJ1Wgtv6LTwBJGqwiKFqIHp4
   4t09tL61teYfrrQ07oEc8iHIzopQU70VrMfs6CEoHeK3HW7JYjznvNixf
   imNbBwsEiAKf7PK8fTjSqfFmPkzYPpncyCjfpGzmILcsuSnCDWNXw93Lz
   A==;
X-CSE-ConnectionGUID: ZYjHu+omSW+b77CJ1njLWQ==
X-CSE-MsgGUID: hG7b3ZU9STegqkdwhxvBYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90364774"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90364774"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 04:58:00 -0700
X-CSE-ConnectionGUID: Vl756/y1R76uHDvDCJCxfQ==
X-CSE-MsgGUID: dUoClHY3SAaqGiK2BAZLRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="279469673"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 30 Sep 2026 04:57:59 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBswf-000000001qd-0ybf;
	Wed, 30 Sep 2026 11:57:57 +0000
Date: Wed, 30 Sep 2026 13:56:57 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 20/26]
 drivers/attestation/core/ctlv.c:1048:1: warning: the frame size of 1648 bytes
 is larger than 1536 bytes
Message-ID: <202609301357.br72PZOV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 7c3e9198f02658988c2f0ea335cdfd75b93236e0 [20/26] attestation: introduce the core framework
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20260930/202609301357.br72PZOV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301357.br72PZOV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301357.br72PZOV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/attestation/core/ctlv.c: In function 'ctlv_attestation_mr_log_get_query':
>> drivers/attestation/core/ctlv.c:1048:1: warning: the frame size of 1648 bytes is larger than 1536 bytes [-Wframe-larger-than=]
    1048 | }
         | ^


vim +1048 drivers/attestation/core/ctlv.c

   967	
   968	int ctlv_attestation_mr_log_get_query(void *priv, struct ctlv_op_ctx *ctx,
   969					      const struct ctlv_cursor *request,
   970					      struct ctlv_cursor *reply)
   971	{
   972		struct attestation *att = priv;
   973		struct attestation_mr_log_entry *entry;
   974		struct ctlv_cursor item, nested;
   975		unsigned int ids[256];
   976		size_t ids_count = 0, index;
   977		unsigned int start, end;
   978		unsigned long xa_index;
   979		u64 boundary;
   980		u64 cursor = ctlv_op_query_cursor(ctx);
   981		int ret;
   982	
   983		ctlv_attestation_mr_log_get_mr_selection_for_each(&item, request) {
   984			u64 id = ctlv_attestation_mr_log_get_selection_mr_id_get(&item);
   985	
   986			if (id > UINT_MAX)
   987				return -ERANGE;
   988			for (index = 0; index < ids_count; index++)
   989				if (ids[index] == id)
   990					return -EINVAL;
   991			ids[ids_count++] = id;
   992		}
   993		if (cursor)
   994			boundary = ctlv_op_query_generation(ctx);
   995		else
   996			boundary = att->log->generation;
   997		if (boundary > UINT_MAX || boundary > att->log->generation)
   998			return -ESTALE;
   999		end = boundary;
  1000		if (ctlv_attestation_mr_log_get_mr_end_generation_present(request)) {
  1001			u64 requested_end =
  1002				ctlv_attestation_mr_log_get_mr_end_generation_get(request);
  1003	
  1004			end = min_t(u64, end, requested_end);
  1005		}
  1006		start = 1;
  1007		if (ctlv_attestation_mr_log_get_mr_start_generation_present(request)) {
  1008			u64 value =
  1009				ctlv_attestation_mr_log_get_mr_start_generation_get(request);
  1010	
  1011			if (value > UINT_MAX)
  1012				return -EINVAL;
  1013			start = value;
  1014		}
  1015		if (att->log->generation && start > end)
  1016			return -EINVAL;
  1017		if (!cursor && att->log->generation) {
  1018			if (!ctlv_attestation_mr_start_generation_put(reply, start) ||
  1019			    !ctlv_attestation_mr_end_generation_put(reply, end))
  1020				return -EMSGSIZE;
  1021		}
  1022		xa_index = cursor ? cursor : start;
  1023		entry = xa_find(&att->log->entries, &xa_index, end, XA_PRESENT);
  1024		while (entry &&
  1025		       !attestation_log_selected(ids, ids_count, entry->mr_id))
  1026			entry = xa_find_after(&att->log->entries, &xa_index, end,
  1027					      XA_PRESENT);
  1028		if (!entry)
  1029			return ctlv_op_query_done(ctx, boundary);
  1030		if (!cursor)
  1031			return ctlv_op_query_more(ctx, boundary,
  1032						  entry->mr_generation);
  1033		if (!ctlv_attestation_log_entry_start(reply, &nested))
  1034			return -EMSGSIZE;
  1035		ret = attestation_mr_log_entry_encode(&nested, entry);
  1036		ctlv_nest_end(&nested);
  1037		if (ret)
  1038			return ret;
  1039		entry = xa_find_after(&att->log->entries, &xa_index, end, XA_PRESENT);
  1040		while (entry &&
  1041		       !attestation_log_selected(ids, ids_count, entry->mr_id))
  1042			entry = xa_find_after(&att->log->entries, &xa_index, end,
  1043					      XA_PRESENT);
  1044		if (entry)
  1045			return ctlv_op_query_more(ctx, boundary,
  1046						  entry->mr_generation);
  1047		return ctlv_op_query_done(ctx, boundary);
> 1048	}
  1049	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
