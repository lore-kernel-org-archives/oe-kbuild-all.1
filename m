Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740E917F50B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jul 2024 12:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721220438; cv=none; b=PGR1Bs0nMjF++zNkuWQH5HRMtjreE2LlnUavMF7eFvNmklLCGfq58TfMrWtSu1MsGMttzYBnF3AykISH4Oh7/7TL9nuhHfhH+NB/4D9Pxv1E3EZ0g7bY5yvfn2zjqiBy9MG+jGdgQhHLK5C/lc58R+v6I8dvNHcu2rpfR9Lbb5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721220438; c=relaxed/simple;
	bh=n0ouIGPdWZLM9mcu58sv6ji5E3mdACS2EG9ldf2yEhU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h6fj5JMgD4u4bbQV8lp4sQUMkjJQ6G1Lct+NW7PiWGAhGOUo8i8ywLMPt8dVBk3VB2rtJ3sfMmcyrEhcuyrTKvktTX/rr8Tw+3xmfWgqCtTaPSp65AyuOjMyIhRB9+DKtukxKTWLpmRI49ALcoE90fKAYLfx3RVNyTkQGvufjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fuXrc6Yw; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fuXrc6Yw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721220436; x=1752756436;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n0ouIGPdWZLM9mcu58sv6ji5E3mdACS2EG9ldf2yEhU=;
  b=fuXrc6YwjJH9W1kGw2WkbxIuaMN3ImtxeOoBNyGQcu8TtRfAC6LLLGtB
   UFeIOpLBiuKbVxzZEhGHAXPDm8WR/NnlHJWM1Qx9KRQOZJNIYQ8MabL8D
   74vcDv+A34zor397zmr7GazocUK6WPIoKnDJBLsh/xQsZTuHla2f+bdE5
   /L+AiRrSwbeK0ypVUwPvxLPPu1KcqFSiubgaZos3um4VwqCbMVvKJF+yW
   O4YoLXzRuamtBrpnKqnei5QTa+9rfqB2G+1+WuT8wVL2IuWmxzJwtqsD7
   xKG7fP9TMMGnBH6QnNKEy1UG2YiXwFaVVRZRru8CXGekiuCHKxA0+2DK/
   w==;
X-CSE-ConnectionGUID: 7rW6W1TVRe2XU9Jwh8N+HQ==
X-CSE-MsgGUID: M/v0UUnuT9yyKlo+7fK0XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="29330994"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="29330994"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 05:47:13 -0700
X-CSE-ConnectionGUID: /eI9UbHAQfuaxgrElqt0NA==
X-CSE-MsgGUID: pesW+8DOTcGxhJ/t+xYnhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50328119"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2024 05:47:13 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU43q-000gL1-1C;
	Wed, 17 Jul 2024 12:47:10 +0000
Date: Wed, 17 Jul 2024 20:46:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 20/44]
 drivers/virt/gunyah/rsc_mgr_rpc.c:222:24: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202407172049.oKLKbvO9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   41bf0d82262953ddeab907af1e8e7850fb939925
commit: ee334bab464b2d240f3144c29e9cfcd256ea7afb [20/44] FROMLIST: gunyah: rsc_mgr: Add memory parcel RPC
config: arm64-randconfig-r112-20240717 (https://download.01.org/0day-ci/archive/20240717/202407172049.oKLKbvO9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240717/202407172049.oKLKbvO9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407172049.oKLKbvO9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/virt/gunyah/rsc_mgr_rpc.c:222:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le16 [usertype] n_entries @@     got restricted __le32 [usertype] @@
   drivers/virt/gunyah/rsc_mgr_rpc.c:222:24: sparse:     expected restricted __le16 [usertype] n_entries
   drivers/virt/gunyah/rsc_mgr_rpc.c:222:24: sparse:     got restricted __le32 [usertype]

vim +222 drivers/virt/gunyah/rsc_mgr_rpc.c

   162	
   163	/**
   164	 * gunyah_rm_mem_share() - Share memory with other virtual machines.
   165	 * @rm: Handle to a Gunyah resource manager
   166	 * @p: Information about the memory to be shared.
   167	 *
   168	 * Sharing keeps Linux's access to the memory while the memory parcel is shared.
   169	 */
   170	int gunyah_rm_mem_share(struct gunyah_rm *rm, struct gunyah_rm_mem_parcel *p)
   171	{
   172		u32 message_id = p->n_acl_entries == 1 ? GUNYAH_RM_RPC_MEM_LEND :
   173							 GUNYAH_RM_RPC_MEM_SHARE;
   174		size_t msg_size, initial_mem_entries = p->n_mem_entries, resp_size;
   175		struct gunyah_rm_mem_share_req_acl_section *acl;
   176		struct gunyah_rm_mem_share_req_mem_section *mem;
   177		struct gunyah_rm_mem_share_req_header *req_header;
   178		size_t acl_size, mem_size;
   179		u32 *attr_section;
   180		bool need_append = false;
   181		__le32 *resp;
   182		void *msg;
   183		int ret;
   184	
   185		if (!p->acl_entries || !p->n_acl_entries || !p->mem_entries ||
   186		    !p->n_mem_entries || p->n_acl_entries > U8_MAX ||
   187		    p->mem_handle != GUNYAH_MEM_HANDLE_INVAL)
   188			return -EINVAL;
   189	
   190		if (initial_mem_entries > GUNYAH_RM_MAX_MEM_ENTRIES) {
   191			initial_mem_entries = GUNYAH_RM_MAX_MEM_ENTRIES;
   192			need_append = true;
   193		}
   194	
   195		acl_size = struct_size(acl, entries, p->n_acl_entries);
   196		mem_size = struct_size(mem, entries, initial_mem_entries);
   197	
   198		/* The format of the message goes:
   199		 * request header
   200		 * ACL entries (which VMs get what kind of access to this memory parcel)
   201		 * Memory entries (list of memory regions to share)
   202		 * Memory attributes (currently unused, we'll hard-code the size to 0)
   203		 */
   204		msg_size = sizeof(struct gunyah_rm_mem_share_req_header) + acl_size +
   205			   mem_size +
   206			   sizeof(u32); /* for memory attributes, currently unused */
   207	
   208		msg = kzalloc(msg_size, GFP_KERNEL);
   209		if (!msg)
   210			return -ENOMEM;
   211	
   212		req_header = msg;
   213		acl = (void *)req_header + sizeof(*req_header);
   214		mem = (void *)acl + acl_size;
   215		attr_section = (void *)mem + mem_size;
   216	
   217		req_header->mem_type = p->mem_type;
   218		if (need_append)
   219			req_header->flags |= GUNYAH_MEM_SHARE_REQ_FLAGS_APPEND;
   220		req_header->label = cpu_to_le32(p->label);
   221	
 > 222		acl->n_entries = cpu_to_le32(p->n_acl_entries);
   223		memcpy(acl->entries, p->acl_entries,
   224		       flex_array_size(acl, entries, p->n_acl_entries));
   225	
   226		mem->n_entries = cpu_to_le16(initial_mem_entries);
   227		memcpy(mem->entries, p->mem_entries,
   228		       flex_array_size(mem, entries, initial_mem_entries));
   229	
   230		/* Set n_entries for memory attribute section to 0 */
   231		*attr_section = 0;
   232	
   233		ret = gunyah_rm_call(rm, message_id, msg, msg_size, (void **)&resp,
   234				     &resp_size);
   235		kfree(msg);
   236	
   237		if (ret)
   238			return ret;
   239	
   240		p->mem_handle = le32_to_cpu(*resp);
   241		kfree(resp);
   242	
   243		if (need_append) {
   244			ret = gunyah_rm_mem_append(
   245				rm, p->mem_handle, &p->mem_entries[initial_mem_entries],
   246				p->n_mem_entries - initial_mem_entries);
   247			if (ret) {
   248				gunyah_rm_mem_reclaim(rm, p);
   249				p->mem_handle = GUNYAH_MEM_HANDLE_INVAL;
   250			}
   251		}
   252	
   253		return ret;
   254	}
   255	ALLOW_ERROR_INJECTION(gunyah_rm_mem_share, ERRNO);
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
