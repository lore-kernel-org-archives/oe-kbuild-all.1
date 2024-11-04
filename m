Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801E1B85D3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730732290; cv=none; b=lg/vKEU8yIoMOg9JoLAtwyvF/0b9jeQr6cZ8D3FpW5skZStG5t/Un7NWEWFVOSud3WUnvOxvFqYHW4spxojBoLGgcypfIyQ5OVUwm1l77BTh7YkGbUwrTCYacMXLfQIvp3/kFQ6jhOLotw9kFxdRR2V7VuBZCPwvEAYYR5eWEBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730732290; c=relaxed/simple;
	bh=3d0lcQxvqRlW1+Ks8uyZ0bnpg0wCDQh+sxNdZgFne48=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R9Z37bu+LUv1Olq9qk1i+Ihk6KUGxJ3dL5aOiVxPqQVPV68UYxlLUAkZJsfSMi+untQ9KwbdFLZ7moZKZtFGJFFHGQqR/6FZpdxw2Id6jIXWg1WT03asoKTp8rUQWstIc+Csz3nT2AANPT1E0ag3LwZQyM6qNUShqIZMTjRMklk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EldoCX9H; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EldoCX9H"
Message-ID: <5f6f971d-26f3-4e6a-8b7f-8e1cb746ee57@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730732282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EAgR4Df1QdaV/OJGB5Rxt6rZBMRwSVE2y3ze7P2zpRQ=;
	b=EldoCX9H3I3V0m+Ymip9Oawvj4e4fX++CPSVqXlX8ho7QJT7wZFDaTdiuIExz2if7bd7kD
	dj3+4wV4OqYNPnmr+hCPSeAm8RJagUa1lkECnI/tBt634lermd9Xiag1pWysQAZdx3bX/8
	6o9cdMPuaoeuioH7t7N3RNx2x3JdBdI=
Date: Mon, 4 Nov 2024 09:57:57 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [linux-next:master 7685/8858]
 drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: error: '_preemphasis' directive
 output may be truncated writing 12 bytes into a region of size between 4 and
 14
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <202411040654.iDf1aTGd-lkp@intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <202411040654.iDf1aTGd-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 11/3/24 17:17, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   c88416ba074a8913cf6d61b789dd834bbca6681c
> commit: 28edaacb821c69241f6c0be6bbd29f7145f1b44f [7685/8858] drm: zynqmp_dp: Add debugfs interface for compliance testing
> config: arm64-randconfig-r111-20241103 (https://download.01.org/0day-ci/archive/20241104/202411040654.iDf1aTGd-lkp@intel.com/config)
> compiler: aarch64-linux-gcc (GCC) 14.1.0
> reproduce: (https://download.01.org/0day-ci/archive/20241104/202411040654.iDf1aTGd-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202411040654.iDf1aTGd-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/gpu/drm/xlnx/zynqmp_dp.c: In function 'zynqmp_dp_bridge_debugfs_init':
>>> drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: error: '_preemphasis' directive output may be truncated writing 12 bytes into a region of size between 4 and 14 [-Werror=format-truncation=]
>     2312 |                 snprintf(name, sizeof(name), fmt, i);
>          |                                              ^~~
>    drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:17: note: 'snprintf' output between 18 and 28 bytes into a destination of size 19
>     2312 |                 snprintf(name, sizeof(name), fmt, i);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/gpu/drm/xlnx/zynqmp_dp.c:2317:53: error: '_swing' directive output may be truncated writing 6 bytes into a region of size between 4 and 14 [-Werror=format-truncation=]
>     2317 |                 snprintf(name, sizeof(name), "lane%d_swing", i);
>          |                                                     ^~~~~~
>    drivers/gpu/drm/xlnx/zynqmp_dp.c:2317:17: note: 'snprintf' output between 12 and 22 bytes into a destination of size 19
>     2317 |                 snprintf(name, sizeof(name), "lane%d_swing", i);
>          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: all warnings being treated as errors
> 
> 
> vim +/_preemphasis +2312 drivers/gpu/drm/xlnx/zynqmp_dp.c
> 
>   2278	
>   2279	DEFINE_DEBUGFS_ATTRIBUTE(fops_zynqmp_dp_ignore_hpd, zynqmp_dp_ignore_hpd_get,
>   2280				 zynqmp_dp_ignore_hpd_set, "%llu\n");
>   2281	
>   2282	static void zynqmp_dp_bridge_debugfs_init(struct drm_bridge *bridge,
>   2283						  struct dentry *root)
>   2284	{
>   2285		struct zynqmp_dp *dp = bridge_to_dp(bridge);
>   2286		struct dentry *test;
>   2287		int i;
>   2288	
>   2289		dp->test.bw_code = DP_LINK_BW_5_4;
>   2290		dp->test.link_cnt = dp->num_lanes;
>   2291	
>   2292		test = debugfs_create_dir("test", root);
>   2293	#define CREATE_FILE(name) \
>   2294		debugfs_create_file(#name, 0600, test, dp, &fops_zynqmp_dp_##name)
>   2295		CREATE_FILE(pattern);
>   2296		CREATE_FILE(enhanced);
>   2297		CREATE_FILE(downspread);
>   2298		CREATE_FILE(active);
>   2299		CREATE_FILE(custom);
>   2300		CREATE_FILE(rate);
>   2301		CREATE_FILE(lanes);
>   2302		CREATE_FILE(ignore_aux_errors);
>   2303		CREATE_FILE(ignore_hpd);
>   2304	
>   2305		for (i = 0; i < dp->num_lanes; i++) {
>   2306			static const char fmt[] = "lane%d_preemphasis";
>   2307			char name[sizeof(fmt)];
>   2308	
>   2309			dp->debugfs_train_set[i].dp = dp;
>   2310			dp->debugfs_train_set[i].lane = i;
>   2311	
>> 2312			snprintf(name, sizeof(name), fmt, i);
>   2313			debugfs_create_file(name, 0600, test,
>   2314					    &dp->debugfs_train_set[i],
>   2315					    &fops_zynqmp_dp_preemphasis);
>   2316	
>> 2317			snprintf(name, sizeof(name), "lane%d_swing", i);
>   2318			debugfs_create_file(name, 0600, test,
>   2319					    &dp->debugfs_train_set[i],
>   2320					    &fops_zynqmp_dp_swing);
>   2321		}
>   2322	}
>   2323	
> 

Not errors because num_lanes is at most 4.

--Sean
