Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458B52103
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678435782; x=1709971782;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=5z+w57fc5zODylGZ3zk3CkPbrq5nVBSIKRAeXpL/OzU=;
  b=AwxslXe0tDUHQ+S/PmABZXeXbuZUDx5s9Mswvz04YNw7jeWj4eu4pwCG
   wY6QHW12qb4rz2KzjnL4wJLSOTNNWaMFrU+jm+FD2KgSg+PeD9ftJwaWs
   kzF0g2tJVC8SE0LyH53O9FrQ+YLWYwYkgdbPRLydvaF35sbuZK+mPcGNq
   BEov/XxbeiDSxnG+0Kv7SNrlpNxJ+7BtEHQLqOh+tV4nDs0pS3LqwlSta
   Z3ZBNypVdiW9q2+OegNrayWXgUvCQiCtR3aUlGIz+kFGxhB9vN/JLtJ8w
   v9q2AoOnCUleFJuKvGbx3aKlQCET+sX+hBLAZXnubfCSs23Jq4ncwZ17H
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="401537143"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="401537143"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 00:09:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="766748348"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="766748348"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Mar 2023 00:09:10 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paXoL-0003ej-29;
	Fri, 10 Mar 2023 08:09:09 +0000
Date: Fri, 10 Mar 2023 16:09:02 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RESEND] bluetooth: btbcm: Fix logic error in forming the
 board name.
Message-ID: <ZArlnsW2EfEIMdBP@0f0c699f4fc0>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230224-btbcm-wtf-v1-1-d2dbd7ca7ae4@gmail.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH RESEND] bluetooth: btbcm: Fix logic error in forming the board name.
Link: https://lore.kernel.org/stable/20230224-btbcm-wtf-v1-1-d2dbd7ca7ae4%40gmail.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



