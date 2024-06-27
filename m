Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3A722F11
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 06:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719469646; cv=none; b=b7vFFh/Afyp54B4UAtHZAgW88IMA1rU+ucvgKWBXtAQMRhDapFHf+2kHlS1ZRp8X1QsNQDkNg2CjbHGfaRnKYTngOgAnqS3Pp3kpj1zyOEnQ2wOXg1JtEXFZcWwBkmV3ynCbx9t0wRILZ9ACXlb4W/UXyHr5FYRqKmvc3z2tC+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719469646; c=relaxed/simple;
	bh=PR9V40GV/Yo8OwKjwOfE3OOKrk2D9INTe5XF3MW1mCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YrT+rsSZf6/0/sVza8K9BvjXvd/fbUfQM3IVjdBcTSmZOqiu+hM3g219OHkj70wI7BZb/7cO4am5mxld+oSs91wpHPj5ltSRBe2TzWxmx+oJQeL2NB/6m1gg3ipcL+rGLxHSYwT9MTrtGywBHwEbCtB6ZuKYSoVyH6vy3PK19xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hu068vJ5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hu068vJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719469644; x=1751005644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PR9V40GV/Yo8OwKjwOfE3OOKrk2D9INTe5XF3MW1mCc=;
  b=hu068vJ5s/JQBrHQZrKVkQbfLrngZSUS72LItekSHW3CfpHVaVfGcOXD
   b1YUIbsiPLa5PB50AebfXLWJ+m0StWaHfgISokYMeePtFmUvLW82Kk9hf
   OjIsavfEO9radSSE5el5gNKz/G/MaydnraFqg0tex9JFIqzX8fvgE+QvA
   5Ke0wjwgC1vxspVpToqMUc7XRSsz4aDplGX7wBbkCq1BjcR8vXtMBxxda
   QHWJXACRyOYEA/UpJqGWwEGO1Mz8i/ZuLb4yUsCZlnqsI3CK5D2WujM2G
   9SPAmZI26FXfgArKvt5ZhD4g0zBQgNNSNDo/LQE26GJ8JE+aXLqIFDzyH
   A==;
X-CSE-ConnectionGUID: CP3YgAJyTziBIYebGdRKFA==
X-CSE-MsgGUID: JwkroajQRCSzSsPMbyOsrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16459624"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="16459624"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 23:27:23 -0700
X-CSE-ConnectionGUID: zieqWdD7RnqTiJTe4raz7Q==
X-CSE-MsgGUID: PghM+JNPR9Cy6r/QqT2VNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="48637241"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jun 2024 23:27:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMibI-000Fys-2K;
	Thu, 27 Jun 2024 06:27:20 +0000
Date: Thu, 27 Jun 2024 14:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 1/59] net/8021q/vlanproc.c:241:69: warning:
 format '%x' expects argument of type 'unsigned int', but argument 6 has type
 'long unsigned int'
Message-ID: <202406271455.ZUlDX0Pa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   72f23abc95e0aa951084abce6b15ace9144b02a8
commit: 415a9f6a19268c8ba7c31e6c4e7ebca1834f25f8 [1/59] netdevice: convert private flags > BIT(31) to bitfields
config: i386-randconfig-011-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271455.ZUlDX0Pa-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271455.ZUlDX0Pa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271455.ZUlDX0Pa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/8021q/vlanproc.c: In function 'vlandev_seq_show':
>> net/8021q/vlanproc.c:241:69: warning: format '%x' expects argument of type 'unsigned int', but argument 6 has type 'long unsigned int' [-Wformat=]
     241 |                    "%s  VID: %d  REORDER_HDR: %i  dev->priv_flags: %x\n",
         |                                                                    ~^
         |                                                                     |
         |                                                                     unsigned int
         |                                                                    %lx
     242 |                    vlandev->name, vlan->vlan_id,
     243 |                    (int)(vlan->flags & 1), vlandev->priv_flags);
         |                                            ~~~~~~~~~~~~~~~~~~~       
         |                                                   |
         |                                                   long unsigned int


vim +241 net/8021q/vlanproc.c

   226	
   227	static int vlandev_seq_show(struct seq_file *seq, void *offset)
   228	{
   229		struct net_device *vlandev = (struct net_device *) seq->private;
   230		const struct vlan_dev_priv *vlan = vlan_dev_priv(vlandev);
   231		struct rtnl_link_stats64 temp;
   232		const struct rtnl_link_stats64 *stats;
   233		static const char fmt64[] = "%30s %12llu\n";
   234		int i;
   235	
   236		if (!is_vlan_dev(vlandev))
   237			return 0;
   238	
   239		stats = dev_get_stats(vlandev, &temp);
   240		seq_printf(seq,
 > 241			   "%s  VID: %d	 REORDER_HDR: %i  dev->priv_flags: %x\n",

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
