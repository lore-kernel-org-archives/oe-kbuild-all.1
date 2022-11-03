Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C4E63A0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Nov 2022 17:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667497251; x=1699033251;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vqW9kt3QtjDTsagYNGdwnm79jd6jlHJ3iSbJMKLko/A=;
  b=j6jIOBfm79vlashxhRLAVkZjqBfJZTJTIChs87u7oy/nFrovuuBfmoIE
   UvAUJeon05dZYb/STkSni+xOU6iNrMeghQxQ582slyZSFX6cbZcejdayR
   3NZjBOUV7Hcz/NaCNK2e4WTyZuGSrxkKyMEJlPtuU6/ADH9HlygpjjQpQ
   OqbRzdK9/SYKiwqFxHCqwOrl7uJgWLU59WjCqghWFS/LMgd9SeLvVlAg2
   2Cas5ekeuC8gn4moGwqt4LE/hcf7oD0nEFHHlKT8DJlydgkqifK5YzhlD
   EMg+i0fI0xLLv532lKAxT38MBUgeInkD+6Vcob/QHkbwyn/LkyzrqNbcd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="396060019"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="396060019"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2022 10:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="964022392"
X-IronPort-AV: E=Sophos;i="5.96,134,1665471600"; 
   d="scan'208";a="964022392"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 03 Nov 2022 10:40:49 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqeCv-000G9l-0E;
	Thu, 03 Nov 2022 17:40:49 +0000
Date: Fri, 04 Nov 2022 01:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+1001 bytes kernel size regression] [i386-tinyconfig]
 [e5e4d5e4be] xattr: ensure simple xattrs scale better
Message-ID: <6363fcfe.LVBSqV0TW5VqILgF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +1001 bytes kernel size regression due to commit:

commit: e5e4d5e4be4eb54c5ce57930654a2fe825f713ed (xattr: ensure simple xattrs scale better)
https://github.com/ammarfaizi2/linux-block brauner/linux/fs.xattr.simple.rework


Details as below (size data is obtained by `nm --size-sort vmlinux`):

9abf2313: Linux 6.1-rc1
e5e4d5e4: xattr: ensure simple xattrs scale better

+---------------------------------------+----------+----------+-------+
|                symbol                 | 9abf2313 | e5e4d5e4 | delta |
+---------------------------------------+----------+----------+-------+
| bzImage                               | 491520   | 492096   | 576   |
| nm.t.rhashtable_insert_fast           | 0        | 247      | 247   |
| nm.t.rhashtable_remove_fast.constprop | 0        | 181      | 181   |
| nm.T.simple_xattr_set                 | 256      | 410      | 154   |
| nm.t.rhashtable_lookup                | 0        | 149      | 149   |
| nm.t.put_simple_xattr                 | 0        | 45       | 45    |
| nm.T.simple_xattr_list                | 94       | 128      | 34    |
| nm.T.simple_xattr_get                 | 75       | 106      | 31    |
| nm.t.simple_xattr_obj_hashfn          | 0        | 30       | 30    |
| nm.d.rhash_params                     | 0        | 28       | 28    |
| nm.t.simple_xattr_key_hashfn          | 0        | 26       | 26    |
| nm.t.free_simple_xattr                | 0        | 23       | 23    |
| nm.t.simple_xattr_obj_cmpfn           | 0        | 22       | 22    |
| nm.T.simple_xattrs_free               | 0        | 12       | 12    |
| nm.T.simple_xattrs_init               | 0        | 10       | 10    |
| nm.T.simple_xattr_alloc               | 49       | 56       | 7     |
| nm.T.simple_xattr_add                 | 0        | 6        | 6     |
| nm.t.free_simple_xattr_rcu_cb         | 0        | 5        | 5     |
| nm.t.free_simple_xattr_rhash_cb       | 0        | 2        | 2     |
| nm.D.linux_banner                     | 152      | 154      | 2     |
| nm.T.simple_xattr_list_add            | 13       | 0        | -13   |
+---------------------------------------+----------+----------+-------+



Thanks

