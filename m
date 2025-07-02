Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2C3303DF4
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 18:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751480039; cv=none; b=d7u9dyT1QCFEAMNtLSsmVdYcOCh2r4PqTlFCId/HlY9IzjpSF0rr8JsrXIGux/hn3WjRfOD513Tyziidkv8yY5NJ+1id51jHt4DBkKQ/6vG/fZTlOpac8ZV1AcUcI+Mcfhx8JykwB0cCWzOQTdte+iS5p4A5LSiUMboQOTgY15s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751480039; c=relaxed/simple;
	bh=FTMTBVHafsgOVvWOY9lRkFnzF0EhJ434dvnWnrHjayU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGPkDRJQ3praMDSlyD2glS3OzmQgfT8NlN187L8DGuk5Vecez+pwXfVCKBSM5/txlNzLCAXAcugKWN3oFMYLtdkVahoBizy5c9nK9KxLtvg8OHaQJY8EJ0Yew1j8IfjN0cTXHAo2cDpf7uxcbD4wEN3XKL8zw8UihZAdgSbqpTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwSe8RFD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwSe8RFD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65ED9C4CEE7;
	Wed,  2 Jul 2025 18:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751480036;
	bh=FTMTBVHafsgOVvWOY9lRkFnzF0EhJ434dvnWnrHjayU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwSe8RFDzam1tvgEukuds/+6Lk2LDXvIshl0rGAGkUbVsEaT3NxEgk0b1BubytLEg
	 508mGK7f+8aszscvuUxWPbWM1f0aF/Cs49U6fwZbDMyukvXZe1jM4stnaMWonTLO5x
	 BmKyTBDFH6JMVc+ekejCu+mlRI+RhBl24ju8QkeqYwYgmaHgWXfo2HXhaaBzgzZ+cS
	 F7yuyD3BP6aR9MRIwzBlbiHUN6cDas89dGIGvVrFGYgxTkVEcW0TWR1KVPq66raDse
	 CbDHbPbVLAdOXZnszSI9B+y7N8xgiYtXfh0rVOkhd+hMb3GpLWZ9Mhfg5mM4BLDcCz
	 mp3RVF53PhibQ==
Date: Wed, 2 Jul 2025 21:13:51 +0300
From: Leon Romanovsky <leon@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Yishai Hadas <yishaih@nvidia.com>, oe-kbuild-all@lists.linux.dev,
	Edward Srouji <edwards@nvidia.com>,
	Moshe Shemesh <moshe@nvidia.com>
Subject: Re: [leon-rdma:rdma-next 33/79]
 drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:35:33: error: 'struct
 mlx5_priv' has no member named 'parent_mdev'
Message-ID: <20250702181351.GM6278@unreal>
References: <202507030151.5w1XHRpX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202507030151.5w1XHRpX-lkp@intel.com>

On Thu, Jul 03, 2025 at 01:13:23AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
> head:   839c76b16028184c778569358fdf2ca05a742087
> commit: 89cb32e3172f83069192502e5bc8247522ac9d0d [33/79] net/mlx5: Add support for device steering tag
> config: i386-buildonly-randconfig-005-20250702 (https://download.01.org/0day-ci/archive/20250703/202507030151.5w1XHRpX-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030151.5w1XHRpX-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507030151.5w1XHRpX-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/net/ethernet/mellanox/mlx5/core/lib/st.c: In function 'mlx5_st_create':
> >> drivers/net/ethernet/mellanox/mlx5/core/lib/st.c:35:33: error: 'struct mlx5_priv' has no member named 'parent_mdev'
>       35 |                 return dev->priv.parent_mdev->st;
>          |                                 ^
> 

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/st.c b/drivers/net/ethernet/mellanox/mlx5/core/lib/st.c
index 85e4e0c90f34..2ab1b31f5db3 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/lib/st.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/lib/st.c
@@ -31,7 +31,7 @@ struct mlx5_st *mlx5_st_create(struct mlx5_core_dev *dev)
        if (!MLX5_CAP_GEN(dev, mkey_pcie_tph))
                return NULL;

-       if (mlx5_core_is_sf(dev))
+       if (IS_ENABLED(CONFIG_MLX5_SF) && mlx5_core_is_sf(dev))
                return dev->priv.parent_mdev->st;

        /* Checking whether the device is capable */

