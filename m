Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0CC4F88C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 09:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709629638; cv=none; b=ALgxMOx5r9z0SoPWCSJSKswmA9hu8aCWSy2oOZx3xX8n7FbclhQteAkJl/4Xs/DAWFn1QIDr2hUaHl4GNvBJn0d1RRhTYLJAm0RW9tcaeWHHJjFp8dPqNU2PkLKdu3ID+Wthm1tvFXLd2aMTg9pJjewO2NTeZNcyMBhPJt9qYD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709629638; c=relaxed/simple;
	bh=9WEc4n6Ei3M6Kco+XNEq65PwEqC56NUUfB6CTrVtae8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqJBKczoHY+83uVeRRtoxh0szzUPi2452dj32mEPEtEcvaviGXtt6NNwiIvDURvhofDI8mBaQd4IMaCJG9owuPJwl50SrFxcRYVaAA0UwcLTX16Jq2BT2g22aRWjDBbFXIczhrHlHQJ8gng8Z21dsAUAl9qY/2MLmiGcx60EzCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6LOvYul; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6LOvYul"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F629C433C7;
	Tue,  5 Mar 2024 09:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709629638;
	bh=9WEc4n6Ei3M6Kco+XNEq65PwEqC56NUUfB6CTrVtae8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M6LOvYuljFHOin/Dac98sgx8z6Tc+XsYMR6+gTX3YilM5IEWV/jwzfi162PYd9ncX
	 7JQnmxvkUw4YqwFcfYIVlfzsTbwsMeSnhsxoJNq1xI/TFw1CFNOuV9YPWgyvaaoZ20
	 VXCkpuPr+Z5j4V5U+nVkVCkqKlM6veytwY1vpY/TW5T63cOUXfoh9j6eDIIqjeoLit
	 XBIyi0V089c3Q8640TKVzu8lqwdIu/1wv8aBQvPlUyDP7lGZsDTDCiaYIjWHTL29GQ
	 2jVwFCWJo0YdewbP+0b5zigvQL6ct7Ai1zakGnGCoZIWMStbrVaR8XHi8Yy4PR6kTm
	 YHwTpxlliFSEw==
Date: Tue, 5 Mar 2024 10:07:14 +0100
From: Christian Brauner <brauner@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Eric Sandeen <sandeen@redhat.com>, oe-kbuild-all@lists.linux.dev, 
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: Re: [brauner-vfs:vfs.mount.api 3/3] fs/openpromfs/inode.c:417:27:
 error: 'openpromfs_reconfigure' undeclared here (not in a function); did you
 mean 'openprom_reconfigure'?
Message-ID: <20240305-backofen-feinmechaniker-528d14d24cd7@brauner>
References: <202403050807.RSK5Px2v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <202403050807.RSK5Px2v-lkp@intel.com>

On Tue, Mar 05, 2024 at 08:54:04AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.mount.api
> head:   0540b5e5fc1fb89be71af08ddfc7c21a22828ec5
> commit: 0540b5e5fc1fb89be71af08ddfc7c21a22828ec5 [3/3] openpromfs: finish conversion to the new mount API
> config: sparc-defconfig (https://download.01.org/0day-ci/archive/20240305/202403050807.RSK5Px2v-lkp@intel.com/config)
> compiler: sparc-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403050807.RSK5Px2v-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403050807.RSK5Px2v-lkp@intel.com/
> 
> All error/warnings (new ones prefixed by >>):
> 
> >> fs/openpromfs/inode.c:417:27: error: 'openpromfs_reconfigure' undeclared here (not in a function); did you mean 'openprom_reconfigure'?
>      417 |         .reconfigure    = openpromfs_reconfigure,
>          |                           ^~~~~~~~~~~~~~~~~~~~~~
>          |                           openprom_reconfigure
> >> fs/openpromfs/inode.c:358:12: warning: 'openprom_reconfigure' defined but not used [-Wunused-function]
>      358 | static int openprom_reconfigure(struct fs_context *fc)
>          |            ^~~~~~~~~~~~~~~~~~~~

Fixed, thanks!
