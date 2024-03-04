Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4FF17C9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Mar 2024 01:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709515660; cv=none; b=U0IuP2mq8t+hs5f8c577QVh9u7h7X9NlyhZ6SdOenyC2ZIcbEiQGHEEpvzT4nyl79gufYPCLkfZdUnongwbk5Ep3YycEiG9KGLUqyPlcgwt1g0HADsTGF2RZ7FizRU1/tawmH5Na1PRIr8PMiwhxmfgWXkZgY88QYiZgDMCkkts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709515660; c=relaxed/simple;
	bh=Z3Gdm8zXjUUYzF/0skr/TKPirWnxc7Pp2dK875F55AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iE2i3qOEjo+EYqaXhC7cSsyWN5N40FhkP4dh0QfuaXnFWxI6DsAGt53cWbx8jQNh5MNImt0F/jBrB6BzRzcp8qzc9Nl5qiRcogt1yimDGe2hFlgYPQmmH0jctByNEWjCCRSbYF4DBn88q4weNUtatS9Mkn88INzLIBVI0zhLIUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjBXD7vc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjBXD7vc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709515658; x=1741051658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z3Gdm8zXjUUYzF/0skr/TKPirWnxc7Pp2dK875F55AQ=;
  b=KjBXD7vcSysFVPO7t9QUScpJhy8d6512/brPTKFw4y2ur+pwkvQy8BpB
   BdzwGAafIrZnDpMh1/xmGYWdcv43J/GGB53pn9YXc39njaPsaq9104fw8
   t+M8yeA68JguROlUWv7ZEQ7xawpTnyR9GtFSUgYjKzDYjO/wwv65B4DqJ
   DXsO4tXoL12fqjcEdfAaYC6lcLlrNHd0nab8LpeC8EWfWmhzu4TL7EiFX
   FvChmajHHpQQvLCLv/XmqOC+YTuLG0n5M8yToUwUXPBZ8AlMshKvVjrtc
   CL1TZHF8qB/WoT03DXCoQQT7W7WxtmxcJoiWxG4dXV9QzRtubl9KgV659
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="29414079"
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="29414079"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2024 17:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,201,1705392000"; 
   d="scan'208";a="8707290"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Mar 2024 17:27:37 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgx78-0002FB-1s;
	Mon, 04 Mar 2024 01:27:34 +0000
Date: Mon, 4 Mar 2024 09:26:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 17376/27938]
 drivers/staging/ethosu/ethosu_cancel_inference.c:90:21: warning: implicit
 conversion from 'enum ethosu_core_status' to 'enum ethosu_uapi_status'
Message-ID: <202403040903.NwS6UtoL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   d761b18f6bc83bce94251467e3c0974243318456
commit: e7840a92da7eb09468c37913f16532fb5dbc1b9f [17376/27938] LF-7158-6 ethosu: Add support for inference cancellation
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240304/202403040903.NwS6UtoL-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240304/202403040903.NwS6UtoL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403040903.NwS6UtoL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/ethosu/ethosu_cancel_inference.c: In function 'ethosu_cancel_inference_request':
>> drivers/staging/ethosu/ethosu_cancel_inference.c:90:21: warning: implicit conversion from 'enum ethosu_core_status' to 'enum ethosu_uapi_status' [-Wenum-conversion]
      90 |         inf->status = ETHOSU_CORE_STATUS_ABORTING;
         |                     ^


vim +90 drivers/staging/ethosu/ethosu_cancel_inference.c

    66	
    67	int ethosu_cancel_inference_request(struct ethosu_inference *inf,
    68					    struct ethosu_uapi_cancel_inference_status *uapi)
    69	{
    70		struct ethosu_cancel_inference *cancellation;
    71		int ret;
    72		int timeout;
    73	
    74		if (inf->done) {
    75			uapi->status = ETHOSU_UAPI_STATUS_ERROR;
    76	
    77			return 0;
    78		}
    79	
    80		cancellation =
    81			devm_kzalloc(inf->edev->dev,
    82				     sizeof(struct ethosu_cancel_inference),
    83				     GFP_KERNEL);
    84		if (!cancellation)
    85			return -ENOMEM;
    86	
    87		/* increase ref count on the inference we are referring to */
    88		ethosu_inference_get(inf);
    89		/* mark inference ABORTING to avoid resending the inference message */
  > 90		inf->status = ETHOSU_CORE_STATUS_ABORTING;
    91	
    92		cancellation->edev = inf->edev;
    93		cancellation->inf = inf;
    94		cancellation->uapi = uapi;
    95		init_completion(&cancellation->done);
    96		cancellation->msg.fail = ethosu_cancel_inference_fail;
    97	
    98		/* Never resend messages but always complete, since we have restart the
    99		 * whole firmware and marked the inference as aborted
   100		 */
   101		cancellation->msg.resend = ethosu_cancel_inference_complete;
   102	
   103		ret = ethosu_rpmsg_register(&cancellation->edev->erp,
   104					    &cancellation->msg);
   105		if (ret < 0)
   106			goto kfree;
   107	
   108		dev_dbg(cancellation->edev->dev,
   109			"Inference cancellation create. cancel=0x%pK, msg.id=%d\n",
   110			cancellation, cancellation->msg.id);
   111	
   112		ret = ethosu_cancel_inference_send(cancellation);
   113		if (ret != 0)
   114			goto deregister;
   115	
   116		/* Unlock the mutex before going to block on the condition */
   117		mutex_unlock(&cancellation->edev->mutex);
   118		/* wait for response to arrive back */
   119		timeout = wait_for_completion_timeout(&cancellation->done,
   120						      msecs_to_jiffies(CANCEL_INFERENCE_RESP_TIMEOUT_MS));
   121	
   122		/* take back the mutex before resuming to do anything */
   123		ret = mutex_lock_interruptible(&cancellation->edev->mutex);
   124		if (ret != 0)
   125			goto deregister;
   126	
   127		if (timeout == 0) {
   128			dev_warn(inf->edev->dev,
   129				 "Msg: Cancel Inference response lost - timeout\n");
   130			ret = -EIO;
   131			goto deregister;
   132		}
   133	
   134		if (cancellation->errno) {
   135			ret = cancellation->errno;
   136			goto deregister;
   137		}
   138	
   139	deregister:
   140		ethosu_rpmsg_deregister(&cancellation->edev->erp,
   141					&cancellation->msg);
   142	
   143	kfree:
   144		dev_dbg(cancellation->edev->dev,
   145			"Cancel inference destroy. cancel=0x%pK\n", cancellation);
   146		/* decrease the reference on the inference we are referring to */
   147		ethosu_inference_put(cancellation->inf);
   148		devm_kfree(cancellation->edev->dev, cancellation);
   149	
   150		return ret;
   151	}
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
