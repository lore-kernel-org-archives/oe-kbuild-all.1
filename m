Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360031E9B12
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 21:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765403283; cv=none; b=JOh7O8aGCUw59Cu7LP5zrcRbDPZy1UxyafS95Oar4NP6dh4GWGKiDMarxtlgHMEhXTKjudbXZTRMXMNVKGck/XRPcR0WMD075hkDDg/DhxTAa4Q51sH2Zc0VkuDAjw/eZY0KmYtQWN8eVqe3lHlg2hpfT3Cj5tmWDcjoTCPoonw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765403283; c=relaxed/simple;
	bh=bWQ79uok7hI5d2cQvFmt39nbkMjjQcYwJpgdMdKJ3Do=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B7Y/fpD9omvVeQfylBxJZlgCQG5W69b6CZSE5kqu03bjn/Yk2MaMYLrcG2Yt5GwErX0WWcHO72O+s1GTOLoBuSsHOrw6wvDW1gRyDDcZxEcegWeJzHOpVCVQ5WSCX1VON2iVg5p+VqCtPNGFWLw9j1SkcKZrIDSR0ME9obvErhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BXU44SDu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BXU44SDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765403282; x=1796939282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bWQ79uok7hI5d2cQvFmt39nbkMjjQcYwJpgdMdKJ3Do=;
  b=BXU44SDugJdiDjdN6UOyUfYTeq1HToHqYXsb/ROyoISyYQ1hzO2oftZB
   zW7BhwQZy5PFTT0vlYQmpGylC4IgIGLM0LgyApltvhEBpOLHq3GZPHPY7
   ZPBtMMrsg9oEguzmeEUX1je0rsF459gRbr8YtXFni9zANCEHSzZXuyPsF
   AzhCxrpKR6UuegkXWS0UIXs3wM8uU8hypoUHDkO4aoeDeri8Z9NxjHKiu
   uLMtd0BxmD6ErH9YYRkc3s9M9gWfCrXgoHzXy7jQ2iqiLnxVuhQFXZlUX
   Anc5mAnfgVB5vJPmiVBdTOIKhVd2VH2OmWS82fVw4rYykpgt91odanhW9
   w==;
X-CSE-ConnectionGUID: fZ6GLN0qSyqGG3KWCrHcsg==
X-CSE-MsgGUID: psAa0u1cS8aa+bFV6P6RVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78002270"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78002270"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 13:47:59 -0800
X-CSE-ConnectionGUID: 4Wgk8ASpSSmQ1xPBXQwmcg==
X-CSE-MsgGUID: N2voMpp3RGGAIUac7LUwPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196680154"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 Dec 2025 13:47:58 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTS2N-000000003nj-2DXO;
	Wed, 10 Dec 2025 21:47:55 +0000
Date: Thu, 11 Dec 2025 05:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, c00514209 <chenwen54@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508]
 drivers/ub/urma/ubcore/ubcore_msg.c:205:27: sparse: sparse: symbol
 'ubcore_asyn_send_ue2mue_msg' was not declared. Should it be static?
Message-ID: <202512110538.WcU44lJd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: b303cf2411a212c47f1dc4616f77ea9ae016696d [3508/3508] ubcore: add genl, netlink and vtp support to ubcore module.
config: arm64-randconfig-r112-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110538.WcU44lJd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110538.WcU44lJd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110538.WcU44lJd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ub/urma/ubcore/ubcore_msg.c:205:27: sparse: sparse: symbol 'ubcore_asyn_send_ue2mue_msg' was not declared. Should it be static?
--
>> drivers/ub/urma/ubcore/ubcore_device.c:322:22: sparse: sparse: symbol 'ubcore_find_mue_device_legacy' was not declared. Should it be static?
   drivers/ub/urma/ubcore/ubcore_device.c:1354:5: sparse: sparse: symbol 'ubcore_dispatch_event' was not declared. Should it be static?
   drivers/ub/urma/ubcore/ubcore_device.c:2010:6: sparse: sparse: symbol 'ubcore_net_exit' was not declared. Should it be static?
   drivers/ub/urma/ubcore/ubcore_device.c:474:56: sparse: sparse: invalid access past the end of 'g_ht_params' (160 160)
   drivers/ub/urma/ubcore/ubcore_device.c:477:58: sparse: sparse: invalid access past the end of 'g_ht_params' (200 160)
   drivers/ub/urma/ubcore/ubcore_device.c:486:58: sparse: sparse: invalid access past the end of 'g_ht_params' (520 160)
   drivers/ub/urma/ubcore/ubcore_device.c:490:57: sparse: sparse: invalid access past the end of 'g_ht_params' (600 160)
--
>> drivers/ub/urma/ubcore/ubcore_vtp.c:170:6: sparse: sparse: symbol 'ubcore_add_vtp_work_list' was not declared. Should it be static?
>> drivers/ub/urma/ubcore/ubcore_vtp.c:177:6: sparse: sparse: symbol 'ubcore_del_vtp_work_list' was not declared. Should it be static?

vim +/ubcore_asyn_send_ue2mue_msg +205 drivers/ub/urma/ubcore/ubcore_msg.c

   201	
   202	/**
   203	 *	If you do not need to wait for the response of a message, use ubcore_asyn_send_ue2mue_msg.
   204	 */
 > 205	struct ubcore_msg_session *
   206	ubcore_asyn_send_ue2mue_msg(struct ubcore_device *dev, struct ubcore_req *req)
   207	{
   208		struct ubcore_msg_session *s;
   209		int ret;
   210	
   211		req->msg_id = ubcore_get_msg_seq();
   212		s = ubcore_create_msg_session(req);
   213		if (s == NULL) {
   214			ubcore_log_err("Failed to create req session!\n");
   215			return NULL;
   216		}
   217	
   218		ret = ubcore_send_req(dev, req);
   219		(void)kref_put(&s->kref, ubcore_free_msg_session);
   220		if (ret != 0) {
   221			ubcore_log_err(
   222				"Failed to send req, msg_id = %u, opcode = %u.\n",
   223				req->msg_id, (uint16_t)req->opcode);
   224			ubcore_destroy_msg_session(s);
   225			return NULL;
   226		}
   227		return s;
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
