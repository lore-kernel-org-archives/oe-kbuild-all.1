Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747175;
	b=PFyJJhVQswAOXBZfjeOfXSJ9MQYoTf01sHXeV3cqUQ6T8fdVDBnEn7lNuMzMVX+3Jcfy
	 ONXaMX7LmShfn6nb+T3MIHfPlQ+7vbGJTrto2eOl2NMzA/nIXsDFebB8eVu5ejFCC6q52
	 FgvC0l3q++Ae2kUI7w1QWy63ZzTev/tzZlKV5FIgYFbvuuz8y34/iANFD0BBu85t6QvOz
	 NIs98XVFJQqbd2kjS2vdR6hoE3Ra2Iyh2NUuKrXTr9X/XwXGXcT2xURlOFg7aaKdo7ty1
	 Ete+CjLuhrGjpCn7VwUV52fOBh87SO6njqo4C0SsgJjlIqSurWBLntxPcv1AJmWj1NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747175;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/ES8nYm8rBuDHuLYUL44ptz6U0ab/ZcPj5ermERDTn8=;
	b=v4vrBoc+nkS4rOEoouY33+F/nsiALAUG0Vly/hgdVk6VNptJG5Wp7jEc98Sx5/tQToCA
	 uI3+oSIFBcxMSNtn9yredEFTi1IbdCviH0x1nZeowtMyUhrhqIYrm0X8WVI5IV/S21gA+
	 yXitDt3hOTG+NCG1wh1fn/Jy1w+9cZska7o/YWd50ZqmHZuld1SkUU5wwbApEamHIOqF7
	 b1XfTVPrhv6jb42WnIr0QbkZn5v9Awfkh9jB5RwUO8N4dgOLl+LTNIO3kgs6nun8MMsM5
	 vwHRI47oMU8CfLlkrp7gdt2KpxlXtm5dqGCAtA1q9F+VdNVqEa0suG0oPwU60fxJ9nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iF32Nqjw;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8332F606A31D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Nov 2026 12:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8332F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iF32Nqjw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794747175; x=1826283175;
  h=date:from:to:cc:subject:message-id;
  bh=b1vV31N+ll0KzhQtz7NYzY9KmuD3qZsoZ90hO6gnTlU=;
  b=iF32NqjwNOxRrZeNtIIW8AaMqU5b2bUt7uHfPUKb4co30DZsOCmJzBKT
   n9/AFG3jkA/xWtwpns4SNP+cBKJBpn2cnzeXxoKZZsMBwZNtXosJjjtvE
   cnS2dQVjtu9ca+BwT19vGhChU4DWEt0HQhRKBU4L+g3gV1dwLPAe/5E9W
   5vB5mC+WBNbXIiRRADbYocHtddssqu7be4rscMmrO4hLXkukl76IwIhuZ
   gTHWYr9SXU5ZZw1tivYoCgslP6gkpTcjzAfUEdVCSSJpH8zqW6Jq/15un
   zdYh2mPDZjRESJgs8L1OfOaQOcWc/wDJ98MWjcA0dxzsWIkWixSYtSyrY
   w==;
X-CSE-ConnectionGUID: goIev76xTGSXUiAxu69CLw==
X-CSE-MsgGUID: DrOBT+9XQkKKjZ9baeoBCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3504083"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3504083"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 04:52:54 -0800
X-CSE-ConnectionGUID: Uw37l+mjT+uOt5x+Yq/jsw==
X-CSE-MsgGUID: ponUsVWNS2GguRZkhNTFpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9163848"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2026 04:52:53 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSZj0-000000016qa-1kXb;
	Sun, 15 Nov 2026 12:52:50 +0000
Date: Sun, 15 Nov 2026 20:52:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_2 26/68]
 drivers/attestation/core/ctlv.c:600:1: warning: the frame size of 1328 bytes
 is larger than 1280 bytes
Message-ID: <202611152042.mIEPouBc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 16f591ff3ae9d9236ce15a997eeaa3e037bde4a0 [26/68] attestation: Add the measurement register journal
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20261115/202611152042.mIEPouBc-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611152042.mIEPouBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611152042.mIEPouBc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/attestation/core/ctlv.c: In function 'ctlv_attestation_mr_log_get_query':
>> drivers/attestation/core/ctlv.c:600:1: warning: the frame size of 1328 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     600 | }
         | ^


vim +600 drivers/attestation/core/ctlv.c

   524	
   525	int ctlv_attestation_mr_log_get_query(struct ctlv *ctlv, struct ctlv_op_ctx *ctx,
   526					      const struct ctlv_cursor *request, struct ctlv_cursor *reply)
   527	{
   528		struct attestation_dev *att = attestation_from_ctlv(ctlv);
   529		struct attestation_mr_log_entry *entry;
   530		struct ctlv_cursor item, inner;
   531		unsigned int ids[256];
   532		size_t ids_count = 0, index;
   533		unsigned int start, end;
   534		unsigned long xa_index;
   535		u64 boundary;
   536		u64 cursor = ctlv_op_query_cursor(ctx);
   537		bool progress = false;
   538		int ret;
   539	
   540		ctlv_attestation_mr_log_get_selection_for_each(&item, request)
   541		{
   542			u64 id = ctlv_attestation_mr_log_get_selection_id_get(&item);
   543	
   544			for (index = 0; index < ids_count; index++)
   545				if (ids[index] == id)
   546					return -EINVAL;
   547			if (WARN_ON_ONCE(ids_count == ARRAY_SIZE(ids)))
   548				return -EINVAL;
   549			ids[ids_count++] = id;
   550		}
   551	
   552		if (cursor)
   553			boundary = ctlv_op_query_generation(ctx);
   554		else
   555			boundary = att->log->generation;
   556		if (boundary > UINT_MAX || boundary > att->log->generation)
   557			return -ESTALE;
   558	
   559		end = boundary;
   560		if (ctlv_attestation_mr_end_generation_present(request)) {
   561			u64 requested_end = ctlv_attestation_mr_end_generation_get(request);
   562	
   563			end = min_t(u64, end, requested_end);
   564		}
   565	
   566		start = 1;
   567		if (ctlv_attestation_mr_start_generation_present(request))
   568			start = ctlv_attestation_mr_start_generation_get(request);
   569		if (att->log->generation && start > end)
   570			return -EINVAL;
   571	
   572		if (!cursor && att->log->generation) {
   573			if (!ctlv_attestation_mr_start_generation_put(reply, start) ||
   574			    !ctlv_attestation_mr_end_generation_put(reply, end))
   575				return -EMSGSIZE;
   576			progress = true;
   577		}
   578	
   579		xa_for_each_range(&att->log->entries, xa_index, entry, cursor ? cursor : start, end) {
   580			if (!attestation_log_selected(ids, ids_count, entry->mr_id))
   581				continue;
   582			if (!ctlv_attestation_mr_log_get_entries_start(reply, &inner))
   583				break;
   584			ret = attestation_mr_log_entry_encode(&inner, entry);
   585			if (ret == -EMSGSIZE) {
   586				ctlv_record_cancel(&inner);
   587				break;
   588			}
   589			ctlv_record_end(&inner);
   590			if (ret)
   591				return ret;
   592			progress = true;
   593		}
   594	
   595		if (!entry)
   596			return ctlv_op_query_done(ctx, boundary);
   597		if (!progress)
   598			return -EMSGSIZE;
   599		return ctlv_op_query_more(ctx, boundary, entry->mr_generation);
 > 600	}

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
