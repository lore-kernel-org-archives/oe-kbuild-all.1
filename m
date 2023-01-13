Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCEA639
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jan 2023 04:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673582731; x=1705118731;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bsD9dvO/nFNanxxnVEIl9gUHT+z0vFWomI347knAwHo=;
  b=Gl2CzIanS8gjSWdPBYQCIa1jRIuarD8eOimC+VL2xzAt2HY4iMR7YpCd
   /QmXVatmqxknKhQwq0liYsPew0R/JCQhaFWJWzEEmSxpQGRj+5CUTtXiR
   K+96i7vcpTylJlW0k+GMd2Qmc18DS1vjBHhxn1CKGiucspgY1a+yfEE8Y
   1d0nbK131KlDUBLBXJ+826vsQTT0G5A/+TEekG/nDDp7iRaIlmwLFh7gG
   AZqjeIbDUB48SB+D5TCEeFpnQN9FI07X5dTZPJ5w6e+LvLMoz246evdfx
   ZQplVTMNqZ6Hk7Qq+yim2APCyqig1YT94pxJgIp+4QofDPjoXAm1ICr20
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="304289060"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
   d="scan'208";a="304289060"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 20:05:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="690368004"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
   d="scan'208";a="690368004"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Jan 2023 20:05:29 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pGBJj-000Afs-0e;
	Fri, 13 Jan 2023 04:05:26 +0000
Date: Fri, 13 Jan 2023 12:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+356 bytes kernel size regression] [i386-tinyconfig]
 [3d4d867573] fs: move mnt_idmap
Message-ID: <63c0d879.xKY+tSlb0RSuF7Dz%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +356 bytes kernel size regression due to commit:

commit: 3d4d8675739278a549488f3432d290ca1cf9504a (fs: move mnt_idmap)
https://git.kernel.org/cgit/linux/kernel/git/vfs/idmapping.git fs.idmapped.mnt_idmap.conversion


Details as below (size data is obtained by `nm --size-sort vmlinux`):

9e28214e: fs: port vfs{g,u}id helpers to mnt_idmap
3d4d8675: fs: move mnt_idmap

+----------------------------------+----------+----------+-------+
|              symbol              | 9e28214e | 3d4d8675 | delta |
+----------------------------------+----------+----------+-------+
| bzImage                          | 496064   | 496160   | 96    |
| nm.T.begin_new_exec              | 953      | 1008     | 55    |
| nm.T.mnt_idmap_get               | 0        | 54       | 54    |
| nm.T.alloc_mnt_idmap             | 0        | 44       | 44    |
| nm.T.mnt_idmap_put               | 0        | 44       | 44    |
| nm.T.in_group_or_capable         | 3        | 40       | 37    |
| nm.T.mode_strip_sgid             | 63       | 95       | 32    |
| nm.T.may_write_xattr             | 29       | 59       | 30    |
| nm.T.privileged_wrt_inode_uidgid | 21       | 49       | 28    |
| nm.T.generic_fillattr            | 160      | 185      | 25    |
| nm.T.chown_common                | 171      | 194      | 23    |
| nm.T.cap_convert_nscap           | 205      | 224      | 19    |
| nm.T.inode_init_owner            | 88       | 104      | 16    |
| nm.T.put_mnt_ns                  | 43       | 56       | 13    |
| nm.t.mount_setattr_prepare       | 203      | 216      | 13    |
| nm.t.fsuidgid_has_mapping        | 21       | 33       | 12    |
| nm.T.get_vfs_caps_from_disk      | 234      | 246      | 12    |
| nm.t.i_gid_into_vfsgid           | 8        | 17       | 9     |
| nm.t.i_uid_into_vfsuid           | 8        | 17       | 9     |
| nm.T.check_fsmapping             | 0        | 6        | 6     |
| nm.T.vfsgid_in_group_p           | 0        | 6        | 6     |
| nm.T.setattr_copy                | 184      | 190      | 6     |
| nm.T.atime_needs_update          | 234      | 240      | 6     |
| nm.T.cap_inode_getsecurity       | 329      | 335      | 6     |
| nm.T.notify_change               | 634      | 640      | 6     |
| nm.T.from_vfsgid                 | 0        | 3        | 3     |
| nm.T.from_vfsuid                 | 0        | 3        | 3     |
| nm.T.make_vfsgid                 | 0        | 3        | 3     |
| nm.T.make_vfsuid                 | 0        | 3        | 3     |
| nm.T.inode_owner_or_capable      | 17       | 20       | 3     |
| nm.T.mnt_idmap_owner             | 3        | 0        | -3    |
| nm.t.free_vfsmnt                 | 39       | 32       | -7    |
| nm.T.__ia32_sys_mount_setattr    | 258      | 251      | -7    |
| nm.t.from_vfsgid                 | 8        | 0        | -8    |
| nm.t.from_vfsuid                 | 8        | 0        | -8    |
| nm.t.make_vfsgid                 | 8        | 0        | -8    |
| nm.t.make_vfsuid                 | 8        | 0        | -8    |
| nm.t.clone_mnt                   | 404      | 385      | -19   |
| nm.t.mnt_idmap_put               | 32       | 0        | -32   |
| nm.t.do_mount_setattr            | 392      | 322      | -70   |
+----------------------------------+----------+----------+-------+



Thanks

