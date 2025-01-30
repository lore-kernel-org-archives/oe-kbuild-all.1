Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD69D2FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jan 2025 04:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738211315; cv=none; b=MhAo8eRKpWK55bRJWj9FPFcdZsyigmwvTYrCZPG5hgVAxLTzSr1azDoYp9DuHOCE/oDp+hR6BX1vYtgzpoqcPAT+pkzFlsZRq3M9EJ0R7qL8xaf75PY3toOffuHAsXRDGWT6HTvJBjNOJYuyjejfVliIXs35/hVuVpc4O/xPEkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738211315; c=relaxed/simple;
	bh=VzyOo8fhR4N0QXnwPWjrr1ADbwl+7UMJ2z4yf7J+H/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SnDpjwmw0+zENrdIWPJcaNaPulMGDwEKZum63eq7qs49pqYnQy9I1KRR4b3PEFbBt013Yo9632SwCq8RH+mopAgfz5ZcphfJwKLGxq9s+ftn/g/lwutNnWMPPWyV1u7OvOvNH7P28pMJYMdNBR0E9FX2gHdrXftFAwXcYACKwEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHcnGvEu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHcnGvEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738211314; x=1769747314;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VzyOo8fhR4N0QXnwPWjrr1ADbwl+7UMJ2z4yf7J+H/E=;
  b=oHcnGvEuqp2fTKPWIYecX9ZU9VaRvEYvH+x+adrWB8iJ2ogfN15JHN+H
   TE2+DotEnrWCoKc6wmdpQDTP0b44jplMZcsBHkrZApxrKp4h6kwTH4XN5
   5Qpa0QJ9orr3QjTUYkuAQPzGkbxw9b/asMS6mIq1jmgm0pylBh7Dwy6an
   t8Bh3SBJ6Gm+zNDIdB7b0VGED13NGskOMoriMAfCidmvRQbJkrn4+jXHH
   9pShFqQsE1HYYFTiZ6pv2anvv7hbPVW83TCclm0EQUmY3tMTmh+6nGvBa
   xToMlbxWCaqGYWSqRA+Vu6xWfkeMbh6jzDn9TWFq2Cv/EwtibX4RNfw7n
   A==;
X-CSE-ConnectionGUID: AdCNKxw8TzGmPTEJk9CThA==
X-CSE-MsgGUID: jzJm0JxMQ5SO1ARCV18e7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="37989252"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="37989252"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 20:28:33 -0800
X-CSE-ConnectionGUID: u/voXgqvTAystU5GxPlY7A==
X-CSE-MsgGUID: KriH22ZLQDeumC2wu9c9rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="146417031"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jan 2025 20:28:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdMAH-000jfZ-19;
	Thu, 30 Jan 2025 04:28:29 +0000
Date: Thu, 30 Jan 2025 12:27:29 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.mnt_idmap.statmount 4/5]
 samples/vfs/test-list-all-mounts.c:152:62: warning: format '%lu' expects
 argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka
 'unsigned int'}
Message-ID: <202501301205.iHNKdmHb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.mnt_idmap.statmount
head:   0f87a7c2440807adef887628b4929003f1941391
commit: 1c10fd3362d56837a4f01ef8352f8fce1308bacc [4/5] samples/vfs: add STATMOUNT_MNT_{G,U}IDMAP
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250130/202501301205.iHNKdmHb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301205.iHNKdmHb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301205.iHNKdmHb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   samples/vfs/test-list-all-mounts.c: In function 'main':
>> samples/vfs/test-list-all-mounts.c:152:62: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     152 |                                         printf("mnt_uidmap[%lu]: <%s>\n", idx, idmap);
         |                                                            ~~^            ~~~
         |                                                              |            |
         |                                                              |            size_t {aka unsigned int}
         |                                                              long unsigned int
         |                                                            %u
   samples/vfs/test-list-all-mounts.c:161:62: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     161 |                                         printf("mnt_gidmap[%lu]: <%s>\n", idx, idmap);
         |                                                            ~~^            ~~~
         |                                                              |            |
         |                                                              |            size_t {aka unsigned int}
         |                                                              long unsigned int
         |                                                            %u


vim +152 samples/vfs/test-list-all-mounts.c

    70	
    71	int main(int argc, char *argv[])
    72	{
    73	#define LISTMNT_BUFFER 10
    74		__u64 list[LISTMNT_BUFFER], last_mnt_id = 0;
    75		int ret, pidfd, fd_mntns;
    76		struct mnt_ns_info info = {};
    77	
    78		pidfd = sys_pidfd_open(getpid(), 0);
    79		if (pidfd < 0)
    80			die_errno("pidfd_open failed");
    81	
    82		fd_mntns = ioctl(pidfd, PIDFD_GET_MNT_NAMESPACE, 0);
    83		if (fd_mntns < 0)
    84			die_errno("ioctl(PIDFD_GET_MNT_NAMESPACE) failed");
    85	
    86		ret = ioctl(fd_mntns, NS_MNT_GET_INFO, &info);
    87		if (ret < 0)
    88			die_errno("ioctl(NS_GET_MNTNS_ID) failed");
    89	
    90		printf("Listing %u mounts for mount namespace %" PRIu64 "\n",
    91		       info.nr_mounts, (uint64_t)info.mnt_ns_id);
    92		for (;;) {
    93			ssize_t nr_mounts;
    94	next:
    95			nr_mounts = sys_listmount(LSMT_ROOT, last_mnt_id,
    96						  info.mnt_ns_id, list, LISTMNT_BUFFER,
    97						  0);
    98			if (nr_mounts <= 0) {
    99				int fd_mntns_next;
   100	
   101				printf("Finished listing %u mounts for mount namespace %" PRIu64 "\n\n",
   102				       info.nr_mounts, (uint64_t)info.mnt_ns_id);
   103				fd_mntns_next = ioctl(fd_mntns, NS_MNT_GET_NEXT, &info);
   104				if (fd_mntns_next < 0) {
   105					if (errno == ENOENT) {
   106						printf("Finished listing all mount namespaces\n");
   107						exit(0);
   108					}
   109					die_errno("ioctl(NS_MNT_GET_NEXT) failed");
   110				}
   111				close(fd_mntns);
   112				fd_mntns = fd_mntns_next;
   113				last_mnt_id = 0;
   114				printf("Listing %u mounts for mount namespace %" PRIu64 "\n",
   115				       info.nr_mounts, (uint64_t)info.mnt_ns_id);
   116				goto next;
   117			}
   118	
   119			for (size_t cur = 0; cur < nr_mounts; cur++) {
   120				struct statmount *stmnt;
   121	
   122				last_mnt_id = list[cur];
   123	
   124				stmnt = sys_statmount(last_mnt_id, info.mnt_ns_id,
   125						      STATMOUNT_SB_BASIC |
   126						      STATMOUNT_MNT_BASIC |
   127						      STATMOUNT_MNT_ROOT |
   128						      STATMOUNT_MNT_POINT |
   129						      STATMOUNT_MNT_NS_ID |
   130						      STATMOUNT_MNT_OPTS |
   131						      STATMOUNT_FS_TYPE |
   132						      STATMOUNT_MNT_UIDMAP |
   133						      STATMOUNT_MNT_GIDMAP, 0);
   134				if (!stmnt) {
   135					printf("Failed to statmount(%" PRIu64 ") in mount namespace(%" PRIu64 ")\n",
   136					       (uint64_t)last_mnt_id, (uint64_t)info.mnt_ns_id);
   137					continue;
   138				}
   139	
   140				printf("mnt_id:\t\t%" PRIu64 "\nmnt_parent_id:\t%" PRIu64 "\nfs_type:\t%s\nmnt_root:\t%s\nmnt_point:\t%s\nmnt_opts:\t%s\n",
   141				       (uint64_t)stmnt->mnt_id,
   142				       (uint64_t)stmnt->mnt_parent_id,
   143				       (stmnt->mask & STATMOUNT_FS_TYPE)   ? stmnt->str + stmnt->fs_type   : "",
   144				       (stmnt->mask & STATMOUNT_MNT_ROOT)  ? stmnt->str + stmnt->mnt_root  : "",
   145				       (stmnt->mask & STATMOUNT_MNT_POINT) ? stmnt->str + stmnt->mnt_point : "",
   146				       (stmnt->mask & STATMOUNT_MNT_OPTS)  ? stmnt->str + stmnt->mnt_opts  : "");
   147	
   148				if (stmnt->mask & STATMOUNT_MNT_UIDMAP) {
   149					const char *idmap = stmnt->str + stmnt->mnt_uidmap;
   150	
   151					for (size_t idx = 0; idx < stmnt->mnt_uidmap_nr; idx++) {
 > 152						printf("mnt_uidmap[%lu]: <%s>\n", idx, idmap);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
