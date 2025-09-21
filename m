Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0748F5B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Sep 2025 09:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758448712; cv=none; b=LoS1eD3wcqLfzbkGlSS8lCwP1XL2kGaAkzieLDqKpUn5bk6XZ7joL88g76mqPMFh7acAbaM8WZ1JKG4/QtAdnEzHQH+eKTBb3F8nKPFagmWe12M6kGTPXQBIEiUzzd6nf/0mts36kBQi8OTNwHofnFkrE9AVbWFalLSlBBgGjD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758448712; c=relaxed/simple;
	bh=wqCVXQzRjYzd//9p9uWhqfLrRgoN2tWT6phNrZKwcy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QHPgOd9C2yIgk7EMBwjK7FA2t4R41tQD/6UAeKJwJRtPOjHah8FFf2zdBJggscyXT+qQHmejMenKJ99j2qPRXHv2ZlFwxmVkmUEs2ileWjzP14s6jyR2eF7OHHklqBUFpRLm+AIHPQ4eql7phA+qR8tl1BgXoCK4pkdqA+vH0XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F5nLzon4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F5nLzon4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758448711; x=1789984711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wqCVXQzRjYzd//9p9uWhqfLrRgoN2tWT6phNrZKwcy8=;
  b=F5nLzon4Y4k95ASo28x1JnLGxWn46za8wiUZsi0o13oOlOwXhCKIR2Ac
   n+hodKjGZFCNiN2MNu42eYPo6IMpV83FrZxTsiqD6Fo0ZnUzwuQp8kVVw
   SsdxcaJ+qUOjb+TJHGSqGKU3v1xLMrDxfdRn2fb02poJox5sfL7p5yAj2
   Znk51MrXEOnjNptAEgqZIbwzkX00p3xF0Yh/I9r6QIIJynBbyfLNjR/aO
   SPTiWWCT8/Z4rYqUyJJGZFNMrcJl9PhHtMW7Y6+/zJNLOzcy7ODCcjCCt
   FFMwnu6jNUcK933+SEO401r1MrU4IeTBSuXfGafMDO0R9d2xtwGJK03dL
   g==;
X-CSE-ConnectionGUID: iKr0ohQPROy+ImPgTV20fw==
X-CSE-MsgGUID: a9v1l2A4RXWkwvmD3de2FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="60854979"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="60854979"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 02:58:30 -0700
X-CSE-ConnectionGUID: LWU6uPs0TWKEo1sPk4Jx6Q==
X-CSE-MsgGUID: Fu2fOl7NTAaej1cye1sXFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="175508657"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Sep 2025 02:58:30 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0Gpu-0000dl-2j;
	Sun, 21 Sep 2025 09:58:26 +0000
Date: Sun, 21 Sep 2025 17:57:33 +0800
From: kernel test robot <lkp@intel.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/6] vduse: add vq group support
Message-ID: <202509211744.QonosAJv-lkp@intel.com>
References: <20250919093359.961296-4-eperezma@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919093359.961296-4-eperezma@redhat.com>

Hi Eugenio,

kernel test robot noticed the following build errors:

[auto build test ERROR on mst-vhost/linux-next]
[also build test ERROR on next-20250919]
[cannot apply to linus/master v6.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eugenio-P-rez/vduse-make-domain_lock-an-rwlock/20250919-174108
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20250919093359.961296-4-eperezma%40redhat.com
patch subject: [PATCH v3 3/6] vduse: add vq group support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250921/202509211744.QonosAJv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211744.QonosAJv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509211744.QonosAJv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vdpa/pds/vdpa_dev.c:590:35: error: initialization of 's64 (*)(struct vdpa_device *, u16)' {aka 'long long int (*)(struct vdpa_device *, short unsigned int)'} from incompatible pointer type 'u32 (*)(struct vdpa_device *, u16)' {aka 'unsigned int (*)(struct vdpa_device *, short unsigned int)'} [-Wincompatible-pointer-types]
     590 |         .get_vq_group           = pds_vdpa_get_vq_group,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/vdpa/pds/vdpa_dev.c:590:35: note: (near initialization for 'pds_vdpa_ops.get_vq_group')
   drivers/vdpa/pds/vdpa_dev.c:286:12: note: 'pds_vdpa_get_vq_group' declared here
     286 | static u32 pds_vdpa_get_vq_group(struct vdpa_device *vdpa_dev, u16 idx)
         |            ^~~~~~~~~~~~~~~~~~~~~


vim +590 drivers/vdpa/pds/vdpa_dev.c

151cc834f3ddaf Shannon Nelson 2023-05-19  577  
151cc834f3ddaf Shannon Nelson 2023-05-19  578  static const struct vdpa_config_ops pds_vdpa_ops = {
151cc834f3ddaf Shannon Nelson 2023-05-19  579  	.set_vq_address		= pds_vdpa_set_vq_address,
151cc834f3ddaf Shannon Nelson 2023-05-19  580  	.set_vq_num		= pds_vdpa_set_vq_num,
151cc834f3ddaf Shannon Nelson 2023-05-19  581  	.kick_vq		= pds_vdpa_kick_vq,
151cc834f3ddaf Shannon Nelson 2023-05-19  582  	.set_vq_cb		= pds_vdpa_set_vq_cb,
151cc834f3ddaf Shannon Nelson 2023-05-19  583  	.set_vq_ready		= pds_vdpa_set_vq_ready,
151cc834f3ddaf Shannon Nelson 2023-05-19  584  	.get_vq_ready		= pds_vdpa_get_vq_ready,
151cc834f3ddaf Shannon Nelson 2023-05-19  585  	.set_vq_state		= pds_vdpa_set_vq_state,
151cc834f3ddaf Shannon Nelson 2023-05-19  586  	.get_vq_state		= pds_vdpa_get_vq_state,
151cc834f3ddaf Shannon Nelson 2023-05-19  587  	.get_vq_notification	= pds_vdpa_get_vq_notification,
151cc834f3ddaf Shannon Nelson 2023-05-19  588  	.get_vq_irq		= pds_vdpa_get_vq_irq,
151cc834f3ddaf Shannon Nelson 2023-05-19  589  	.get_vq_align		= pds_vdpa_get_vq_align,
151cc834f3ddaf Shannon Nelson 2023-05-19 @590  	.get_vq_group		= pds_vdpa_get_vq_group,
151cc834f3ddaf Shannon Nelson 2023-05-19  591  
151cc834f3ddaf Shannon Nelson 2023-05-19  592  	.get_device_features	= pds_vdpa_get_device_features,
151cc834f3ddaf Shannon Nelson 2023-05-19  593  	.set_driver_features	= pds_vdpa_set_driver_features,
151cc834f3ddaf Shannon Nelson 2023-05-19  594  	.get_driver_features	= pds_vdpa_get_driver_features,
151cc834f3ddaf Shannon Nelson 2023-05-19  595  	.set_config_cb		= pds_vdpa_set_config_cb,
151cc834f3ddaf Shannon Nelson 2023-05-19  596  	.get_vq_num_max		= pds_vdpa_get_vq_num_max,
151cc834f3ddaf Shannon Nelson 2023-05-19  597  	.get_device_id		= pds_vdpa_get_device_id,
151cc834f3ddaf Shannon Nelson 2023-05-19  598  	.get_vendor_id		= pds_vdpa_get_vendor_id,
151cc834f3ddaf Shannon Nelson 2023-05-19  599  	.get_status		= pds_vdpa_get_status,
151cc834f3ddaf Shannon Nelson 2023-05-19  600  	.set_status		= pds_vdpa_set_status,
151cc834f3ddaf Shannon Nelson 2023-05-19  601  	.reset			= pds_vdpa_reset,
151cc834f3ddaf Shannon Nelson 2023-05-19  602  	.get_config_size	= pds_vdpa_get_config_size,
151cc834f3ddaf Shannon Nelson 2023-05-19  603  	.get_config		= pds_vdpa_get_config,
151cc834f3ddaf Shannon Nelson 2023-05-19  604  	.set_config		= pds_vdpa_set_config,
151cc834f3ddaf Shannon Nelson 2023-05-19  605  };
25d1270b6e9ea8 Shannon Nelson 2023-05-19  606  static struct virtio_device_id pds_vdpa_id_table[] = {
25d1270b6e9ea8 Shannon Nelson 2023-05-19  607  	{VIRTIO_ID_NET, VIRTIO_DEV_ANY_ID},
25d1270b6e9ea8 Shannon Nelson 2023-05-19  608  	{0},
25d1270b6e9ea8 Shannon Nelson 2023-05-19  609  };
25d1270b6e9ea8 Shannon Nelson 2023-05-19  610  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
