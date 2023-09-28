Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4B28480
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 14:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA183C433C9;
	Thu, 28 Sep 2023 14:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695912431;
	bh=oNrhmOILIfrvru294f3f7CQ4BkCyzemO+TzIiWOX1eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1TzAd8iHkiY7luHTXGIoms6/UtJyIQES4ihRtlAb7rCeBcyKtjhUIdHOnYsYPX5b
	 7YxBcrloYle7WX0+mdYlRJwYJ1nCmyKrGCMhtAaGjO0UFYYYb847I0MQzeE2l/iOEL
	 0qxQrC9gWtxcQrTg65BKv7idpOZfhv176UWUQ1WjolPsMST8DsFehCxPGKh7pr/ETK
	 ReaxTRuPkJvjdIThqm7ZUmXeITOsqGVksf+et+WfdhJiTBa6aazd3XjS0ykX68gopw
	 Il5Xl4AK+2PSWESfrWhNTif3Ms9FqnXZXjtqs6kCI6caYFwQmyUzXcvH58uvs2Nyto
	 xGopPq/yE5MrA==
Date: Thu, 28 Sep 2023 16:47:08 +0200
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Jan Kara <jack@suse.cz>, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: Re: [brauner-vfs:vfs.super 15/30] drivers/s390/block/dasd.c:3714:19:
 error: non-static declaration of 'dasd_generic_last_path_gone' follows
 static declaration
Message-ID: <20230928-weilen-campen-718cd49ff81e@brauner>
References: <202309280833.eHDrQDAN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202309280833.eHDrQDAN-lkp@intel.com>

On Thu, Sep 28, 2023 at 08:48:07AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.super
> head:   953863a5a2ff126582a21068485dbf7d8ae1d6dc
> commit: 5581d03457f862235d08762822bf6aa913266340 [15/30] s390/dasd: Convert to bdev_open_by_path()
> config: s390-randconfig-001-20230928 (https://download.01.org/0day-ci/archive/20230928/202309280833.eHDrQDAN-lkp@intel.com/config)
> compiler: s390-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280833.eHDrQDAN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202309280833.eHDrQDAN-lkp@intel.com/

Fixed in vfs.super.
