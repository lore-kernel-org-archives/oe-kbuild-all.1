Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46143628
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jan 2023 04:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673582733; x=1705118733;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pZ9++6A9a55zVORKfrBuf6LxROA+sNRdwmlZCVrrag4=;
  b=EwEgBiBvYnJdlK+OgMgyjZ3XNX8EZNiTjO9xL8kiINFoP9xaIQc1lFj+
   yZlFdNFd/gWTjq6Di/jZAuRpV1tKgTisGqsVH7fsiz0bmICOGDmu3WRr2
   8oDpg8CYuySmEJD+wC2i1unJQAHbEJMUio2dJS6mVLq2IHt4hH7605QfT
   yeRw/5KqEKRpiw4lu7ely0bOOCZWWnhwC2ePqb/H08VkWKPE5z0F/bCpo
   aqgg4qgnJh5ekLjoHTGnNLknsxwfp0MqUyynYXjzQ/Jkw4d5phZ60vwnh
   GCsD1cD0iWIZBvATk1m7wqRt5HLA3DieL77I/KJTNNZvkLXBKcDKHqlK0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="322607110"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
   d="scan'208";a="322607110"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 20:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="651393630"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
   d="scan'208";a="651393630"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Jan 2023 20:05:29 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pGBJo-000Afx-2Q;
	Fri, 13 Jan 2023 04:05:28 +0000
Date: Fri, 13 Jan 2023 12:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+69 bytes kernel size regression] [i386-tinyconfig]
 [082334f43a] fs: port vfs_*() helpers to struct mnt_idmap
Message-ID: <63c0d851.WCbtJQp32CAd26ai%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +69 bytes kernel size regression due to commit:

commit: 082334f43a7d2f315625a09ff69bc1dc562bb70b (fs: port vfs_*() helpers to struct mnt_idmap)
https://git.kernel.org/cgit/linux/kernel/git/vfs/idmapping.git fs.idmapped.mnt_idmap.conversion


Details as below (size data is obtained by `nm --size-sort vmlinux`):

68c62775: f2fs: project ids aren't idmapped
082334f4: fs: port vfs_*() helpers to struct mnt_idmap

+--------------------------+----------+----------+-------+
|          symbol          | 68c62775 | 082334f4 | delta |
+--------------------------+----------+----------+-------+
| bzImage                  | 495776   | 495872   | 96    |
| nm.T.vfs_rename          | 843      | 870      | 27    |
| nm.T.do_linkat           | 267      | 284      | 17    |
| nm.T.do_truncate         | 144      | 159      | 15    |
| nm.T.chown_common        | 164      | 175      | 11    |
| nm.T.do_unlinkat         | 351      | 362      | 11    |
| nm.T.vfs_mkdir           | 124      | 134      | 10    |
| nm.T.vfs_truncate        | 164      | 174      | 10    |
| nm.t.do_open             | 386      | 396      | 10    |
| nm.T.vfs_rmdir           | 159      | 168      | 9     |
| nm.T.vfs_unlink          | 167      | 176      | 9     |
| nm.t.do_mknodat          | 364      | 373      | 9     |
| nm.T.notify_change       | 537      | 545      | 8     |
| nm.T.vfs_symlink         | 66       | 73       | 7     |
| nm.T.vfs_mknod           | 93       | 100      | 7     |
| nm.T.vfs_create          | 112      | 119      | 7     |
| nm.t.vfs_tmpfile         | 226      | 231      | 5     |
| nm.T.vfs_link            | 259      | 263      | 4     |
| nm.T.init_link           | 139      | 142      | 3     |
| nm.T.do_mkdirat          | 150      | 148      | -2    |
| nm.T.do_sys_ftruncate    | 214      | 212      | -2    |
| nm.T.do_symlinkat        | 146      | 140      | -6    |
| nm.t.path_openat         | 306      | 300      | -6    |
| nm.T.do_renameat2        | 822      | 814      | -8    |
| nm.t.__file_remove_privs | 167      | 158      | -9    |
| nm.T.vfs_utimes          | 339      | 330      | -9    |
| nm.T.init_symlink        | 90       | 80       | -10   |
| nm.T.init_mkdir          | 118      | 108      | -10   |
| nm.T.chmod_common        | 149      | 139      | -10   |
| nm.T.init_mknod          | 202      | 187      | -15   |
| nm.T.dentry_create       | 111      | 88       | -23   |
+--------------------------+----------+----------+-------+



Thanks

