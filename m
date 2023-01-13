Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC90628
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jan 2023 04:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673582731; x=1705118731;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JVw2QkW2s3rizFQsfR/fnuRsawD+dWNGsOZAo+fp4u8=;
  b=UeIZ2Z0WVcXvrzUwublDY4RyrhGffnIRxIWj2yDs7pXtJ14AyJwAAY23
   isOBYlG9haTOsYL2533NKOjKienTav7Ybaz3D6UGUNTaKlOXJL6B6gSQZ
   28nPLenaMDiyKJ+/gGfrEKS06jvHthG3bYn6oFIDli0BCsjBEKPm74aIO
   00jyt8JErO9442YvecsIFgvIWef1EoZcrzw2kyZobypudbKhx7ct2DxES
   QPaUpo6hisxUCMVT400jR1y4V6tzb8+w/vrs4lujrFx+xpRWhkIW8YcPy
   +DDe5MEHh0eSA7AED3FpnnKLJha3wR+mqZGAjU9ljMPP0zzvrOPybuPwH
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="322607107"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
   d="scan'208";a="322607107"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2023 20:05:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="651393628"
X-IronPort-AV: E=Sophos;i="5.97,212,1669104000"; 
   d="scan'208";a="651393628"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 12 Jan 2023 20:05:29 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pGBJo-000Afu-1R;
	Fri, 13 Jan 2023 04:05:28 +0000
Date: Fri, 13 Jan 2023 12:05:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+207 bytes kernel size regression] [i386-tinyconfig]
 [e978c5e67c] fs: port i_{g,u}id_into_vfs{g,u}id() to mnt_idmap
Message-ID: <63c0d86c.L5xpBu9pbuyc32q/%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +207 bytes kernel size regression due to commit:

commit: e978c5e67c6bfade41fd8e4276627dc1b50447ed (fs: port i_{g,u}id_into_vfs{g,u}id() to mnt_idmap)
https://git.kernel.org/cgit/linux/kernel/git/vfs/idmapping.git fs.idmapped.mnt_idmap.conversion


Details as below (size data is obtained by `nm --size-sort vmlinux`):

80ed6481: fs: port i_{g,u}id_{needs_}update() to mnt_idmap
e978c5e6: fs: port i_{g,u}id_into_vfs{g,u}id() to mnt_idmap

+----------------------------------+----------+----------+-------+
|              symbol              | 80ed6481 | e978c5e6 | delta |
+----------------------------------+----------+----------+-------+
| bzImage                          | 495872   | 496032   | 160   |
| nm.T.notify_change               | 545      | 607      | 62    |
| nm.t.do_open                     | 392      | 453      | 61    |
| nm.T.begin_new_exec              | 922      | 953      | 31    |
| nm.t.HAS_UNMAPPED_ID             | 8        | 27       | 19    |
| nm.T.privileged_wrt_inode_uidgid | 10       | 21       | 11    |
| nm.T.may_write_xattr             | 18       | 29       | 11    |
| nm.T.mode_strip_sgid             | 43       | 54       | 11    |
| nm.T.atime_needs_update          | 207      | 218      | 11    |
| nm.T.setattr_prepare             | 230      | 240      | 10    |
| nm.T.generic_fillattr            | 151      | 160      | 9     |
| nm.T.may_linkat                  | 109      | 116      | 7     |
| nm.t.i_gid_into_vfsgid           | 3        | 8        | 5     |
| nm.t.i_uid_into_vfsuid           | 3        | 8        | 5     |
| nm.t.pick_link                   | 454      | 459      | 5     |
| nm.T.__check_sticky              | 8        | 10       | 2     |
| nm.T.generic_permission          | 151      | 153      | 2     |
| nm.t.may_delete                  | 236      | 234      | -2    |
| nm.T.setattr_should_drop_sgid    | 65       | 61       | -4    |
| nm.T.vfs_dedupe_file_range_one   | 257      | 252      | -5    |
| nm.t.link_path_walk.part         | 603      | 597      | -6    |
| nm.T.setattr_copy                | 204      | 196      | -8    |
| nm.T.mnt_user_ns                 | 30       | 0        | -30   |
+----------------------------------+----------+----------+-------+



Thanks

