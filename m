Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29110539A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748166756; cv=none; b=VZZNmuzsaBI6WuZKXbY8M7rgzVg2G3kSbnuSkJB7qfRVN/J45JVKlOek8Uh0rabwYK9H2wHudcD6h4N97ticZu6eMA8bqcJYX605m40V9OAJK2aVJ4HJ02XaispLqus5JAXq4IUG5yDqdXLEWx8eOUs2ybiJOD6PAWVd4ed1DsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748166756; c=relaxed/simple;
	bh=fj7XzLX03SIxbeUwrJrj4cg4txWCRMGFmw0jLPhATDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OF+AfiovWhL5vSxzzoBj4BDlZXCIEY73o5Cm1TGGbEHaBQUcuiOyF/PouTX5Ksx9sNt5CmBvZdRvfZLHmus9etrkHJewjKGsjRJfAlp0o/BosaaVx5LfJJD3r9jEIlc7usxZcMXCZtlXM67pKXAgaZlHGrpYgTGZRRu3Y2emnOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCeZeYf0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCeZeYf0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748166754; x=1779702754;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fj7XzLX03SIxbeUwrJrj4cg4txWCRMGFmw0jLPhATDA=;
  b=jCeZeYf0WVZAjFOXwPpLSK7aZc9a35R3hk4dNnJcyfJDfLq8dwQovszK
   8PYlTJhU7oWM28v0HcaIjKRmnCJlpm4cpS1y62B10wAn1L96bpeeEiEOe
   UWcsg/IR6ya1g/tuM7gRyzQyvAgoUho4srAwZElQj+0Y+zTON288cVdoz
   3muCL84KucUjvGydtGX47DTvYQBXotgAtjyXU/c+lV9KmJhJHSTZfafxR
   vNU9MdXsEPRc3Vj8x3ocL7adVyLPsYxbdk15eCXPA0Z0qfm+GNYZ6dEhc
   1/c6HoD8fFDh2jeNydBUIqzPMVUxTmokQR/qZ/6kp9XGedcRRJPfPFLiI
   g==;
X-CSE-ConnectionGUID: 9+lOwvhdS0SRqHxy544e2g==
X-CSE-MsgGUID: 2fNTtz1lRlOYuXFr5uM1rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="61515051"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="61515051"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 02:52:34 -0700
X-CSE-ConnectionGUID: 74kRy0VIS0eV8qp9dyBekg==
X-CSE-MsgGUID: AgyoDmhBSQWoy3mJpHAAzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="172806686"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 May 2025 02:52:32 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ81u-000Rjg-1U;
	Sun, 25 May 2025 09:52:30 +0000
Date: Sun, 25 May 2025 17:51:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:container 12/15] security/keys/container.c:142
 keyctl_container_intercept() warn: unsigned 'ns_id' is never less than zero.
Message-ID: <202505251753.gCWFgHoS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   e934156b00c64a64a048108513ab445a232c2120
commit: 1b61c8044bc4e4388e4eb1236a1564ed278dd0ba [12/15] containers: Allow a daemon to intercept request_key upcalls in a container
config: parisc-randconfig-r072-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251753.gCWFgHoS-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251753.gCWFgHoS-lkp@intel.com/

smatch warnings:
security/keys/container.c:142 keyctl_container_intercept() warn: unsigned 'ns_id' is never less than zero.

vim +/ns_id +142 security/keys/container.c

   127	
   128	/*
   129	 * Add or remove (if dest_keyring==0) a request_key upcall intercept trap upon
   130	 * a container.  If _type points to a string of "*" that matches all types.
   131	 */
   132	long keyctl_container_intercept(int containerfd,
   133					const char *_type,
   134					unsigned int ns_id,
   135					key_serial_t dest_ring_id)
   136	{
   137		struct container *c;
   138		struct fd f;
   139		char type[32] = "";
   140		long ret;
   141	
 > 142		if (containerfd < 0 || ns_id < 0)
   143			return -EINVAL;
   144		if (dest_ring_id && !_type)
   145			return -EINVAL;
   146	
   147		f = fdget(containerfd);
   148		if (fd_empty(f))
   149			return -EBADF;
   150		ret = -EINVAL;
   151		if (!is_container_file(fd_file(f)))
   152			goto out_fd;
   153	
   154		c = fd_file(f)->private_data;
   155	
   156		/* Find out what type we're dealing with (can be NULL to make removal
   157		 * remove everything).
   158		 */
   159		if (_type) {
   160			ret = key_get_type_from_user(type, _type, sizeof(type));
   161			if (ret < 0)
   162				goto out_fd;
   163		}
   164	
   165		/* TODO: Get the namespace to filter on */
   166	
   167		/* We add a filter if a destination keyring has been specified. */
   168		if (dest_ring_id) {
   169			ret = key_create_intercept(c, type, dest_ring_id);
   170		} else {
   171			ret = key_del_intercept(c, _type ? type : NULL);
   172		}
   173	
   174	out_fd:
   175		fdput(f);
   176		return ret;
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
