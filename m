Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC76241667
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 May 2025 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746223431; cv=none; b=PqNTwNADOZosb3KuzwG2CTtGypISbGnj48HpyYzch0Y2gWFrPk+AgfSCYKBzKTYqxhm+1/qZo2fsUsye3Rm5+4tAg62REG+mX4o55fHyxfP2gWRkLZQe2ajukmzr11RAYFXNFitJjpMQeaNtLgmgJhBL9UC5sCmYc0ltYp3JlO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746223431; c=relaxed/simple;
	bh=J0rV2ZxgW8jZ7N9Slwd1d5RNHkXMD6Frp2LRfjRbqus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gcyfApjYFKSD76TFRHSUfd8ltf83+mJcZvAPXWEDeQGDOjhSwdwX2czbqkp7meEfKR7eBCYwpOa/l1S6p+W5B+lt0PwvEf9/ohAMLfBCVlDepY2MzUaMQWLhlo7NZ3/pL0ExGTyKCLTY3YfWahJ8FA0AI86WBT9z+RfZR6nF0FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ep2Upm0y; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ep2Upm0y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746223430; x=1777759430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J0rV2ZxgW8jZ7N9Slwd1d5RNHkXMD6Frp2LRfjRbqus=;
  b=ep2Upm0y2Rj65eJ3t0Csws1oCuG79/X/PIT/y+yqsFU63hO1RBAR5iJO
   aMj7IxSx8pftz0k/m+4nVJVozBKh/1Wm8x7YGPab9exYU4LVjMG2x7pD+
   ic3iqu6LDZ2JKcdRFhTwtUIf4MlIOUgEltv8MCCnyDRJYNPHV8Np2HxBE
   7O9Sp3uBkVfXOp4gEFmjkp0u137Vpt7nW2swYKguKhTa2aIH+5CsT9e9k
   g3uc9UCQ1dIEwPWCS/WAkN4TGZHN7pueqa7BUQ0LqW8sdPSn23bp601SA
   xt02n72Al4xE63oZDE/VJH6SRTp4sQhTZqRz1XsTo/WH+39Gglzvy0qJ+
   Q==;
X-CSE-ConnectionGUID: RSLcLYxDQi2joXsmmWTDDQ==
X-CSE-MsgGUID: 991WzBGwTeG69B2teXl+Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="35531214"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="35531214"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 15:03:49 -0700
X-CSE-ConnectionGUID: Sc3VucnnQuG6ZoxCxTN0eg==
X-CSE-MsgGUID: ZzbqZJP0QHaNl/422slbIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="157967265"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 May 2025 15:03:48 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAyTy-00052r-0Y;
	Fri, 02 May 2025 22:03:46 +0000
Date: Sat, 3 May 2025 06:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Jeff Layton <jlayton@kernel.org>
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 3117/4324] samples/vfs/test-list-all-mounts.c:152:62: warning: format '%lu'
 expects argument of type 'long unsigned int', but argument 2 has type
 'size_t' {aka 'unsigned int'}
Message-ID: <202505030543.Khn22WP9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christian,

FYI, the error/warning still remains.

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   da2f3a9f5091c2c6ee04ce79f7031338e6decac3
commit: 713ad4dd44fc1f8e72351e3d0217dde04097d54c [3117/4324] samples/vfs: add STATMOUNT_MNT_{G,U}IDMAP
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250503/202505030543.Khn22WP9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030543.Khn22WP9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505030543.Khn22WP9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   samples/vfs/test-list-all-mounts.c: In function 'main':
>> samples/vfs/test-list-all-mounts.c:152:62: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     152 |                                         printf("mnt_uidmap[%lu]:\t%s\n", idx, idmap);
         |                                                            ~~^           ~~~
         |                                                              |           |
         |                                                              |           size_t {aka unsigned int}
         |                                                              long unsigned int
         |                                                            %u
   samples/vfs/test-list-all-mounts.c:161:62: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     161 |                                         printf("mnt_gidmap[%lu]:\t%s\n", idx, idmap);
         |                                                            ~~^           ~~~
         |                                                              |           |
         |                                                              |           size_t {aka unsigned int}
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
   151					for (size_t idx = 0; idx < stmnt->mnt_uidmap_num; idx++) {
 > 152						printf("mnt_uidmap[%lu]:\t%s\n", idx, idmap);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
