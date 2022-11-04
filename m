Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD44610FE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Nov 2022 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667554210; x=1699090210;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KQlqa/Lqh2H2d0+U4O5ZCjuvO7x0ldW4NbWDp0rnbak=;
  b=aiOElUkVsbEq3GThE+E93ODRJEgcELE6PDPGMAUx34r/ooteqsDic46p
   5RZpHO/uKRBVQU9EyES9A+Mk2zHFX8DR2WpVdZPkYuu2yWqF9KAc8jI3/
   hHDQeP5WdVakcgbt39o4GAFewXLcsYqFaWzgJD5EKLbpiJ4k4Vt2OTJGu
   TonnFuMo/prE07LxGsUShJY1uUdNgMBttQTOll7SJHK/aiS58q+y/owQK
   qUnmJfKSHz7Nq+/gvOsQJsd1bRmoPrKZmKMTWbnfhQOsB3R26j44Pos9p
   pyh9tWjftIZHHfztN/izdb4o5iFj45VaUNjxPetE4peRIac+GgFoIWro5
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="289643676"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="289643676"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2022 02:30:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10520"; a="586130996"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; 
   d="scan'208";a="586130996"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Nov 2022 02:30:08 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oqt1b-000GqY-34;
	Fri, 04 Nov 2022 09:30:07 +0000
Date: Fri, 04 Nov 2022 17:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner (Microsoft) <brauner@kernel.org>,
 Christian Brauner <brauner@kernel.org>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+1000 bytes kernel size regression] [i386-tinyconfig]
 [9de79861dd] xattr: ensure simple xattrs scale better
Message-ID: <6364db6c.qBJMCn1Ys1dz00/5%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +1000 bytes kernel size regression due to commit:

commit: 9de79861dd2eaecc3ef91ffbd3e6f0c33adac3e3 (xattr: ensure simple xattrs scale better)
https://git.kernel.org/cgit/linux/kernel/git/vfs/idmapping.git fs.xattr.simple.rework.rhashtable


Details as below (size data is obtained by `nm --size-sort vmlinux`):

9abf2313: Linux 6.1-rc1
9de79861: xattr: ensure simple xattrs scale better

+---------------------------------------+----------+----------+-------+
|                symbol                 | 9abf2313 | 9de79861 | delta |
+---------------------------------------+----------+----------+-------+
| bzImage                               | 491520   | 492192   | 672   |
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
| nm.D.linux_banner                     | 152      | 153      | 1     |
| nm.T.simple_xattr_list_add            | 13       | 0        | -13   |
+---------------------------------------+----------+----------+-------+



Thanks

