Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B07023A3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Dec 2022 07:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670915987; x=1702451987;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=KAhCNlGVwdQi8BUp123AdOk7JKiwwlP0CIs18w2kaeA=;
  b=dZsb2TejJ6pwIGwzrshJoPINzeJQYPCKAiTRULz7qYzGaEtcXIVYR0an
   s5Zrfw06u4Z9//5J76UaI3o38lYm5YFmjyL3ar27+vqfC91vGjC0wmQeK
   f+WFb4QHEAFXZ9ttH3gz+K7BagBYejLhfbmFPBgq09BNUkWMDzNpjzC9C
   lAda/umMY3oH6rqLM2+guWCRmh9JFHYq0M5G+//+9udjt1m8GgDsX683v
   lJ2ZzIZ5UEa9leeErw4Y/wpFA3pffwx+OW4qR+/3Rpwzz4KVnvAAiP8h3
   Umg5QXxQR/vfXgG1JTzF39xs+8Gq/yLxsV6aPdTC07ODdpnw1M0LNH7b4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="316765499"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="316765499"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2022 23:19:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="648464789"
X-IronPort-AV: E=Sophos;i="5.96,240,1665471600"; 
   d="scan'208";a="648464789"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 Dec 2022 23:19:45 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p4zZo-00049v-0z;
	Tue, 13 Dec 2022 07:19:44 +0000
Date: Tue, 13 Dec 2022 15:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH stable 5.4.y/4.19.y] block: unhash blkdev part inode when
 the part is deleted
Message-ID: <Y5gnRplT8Tll/g+W@0d7994225921>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221213071603.1197703-1-ming.lei@redhat.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH stable 5.4.y/4.19.y] block: unhash blkdev part inode when the part is deleted
Link: https://lore.kernel.org/stable/20221213071603.1197703-1-ming.lei%40redhat.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



