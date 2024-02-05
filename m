Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DDE8210ED
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707139720; cv=none; b=UQ/AtCPpDsYX8bIAIdPccZAp18WQ/orsT+AMUJvp6QBarrNosLOpTxXr1OIol+hDxIisU6HqkHgjDywzDgaBETvjgmYCsWZUOlmqmXOofjQ/B1syOuG4UxAWKeNKo7YJ7cuLbYyMNK82hQhSWmlDSFKQr5MnNMsBAipWGHu1qh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707139720; c=relaxed/simple;
	bh=FE8Y5uF5D7ljUPBvI4e8wuwGw/DPsmuXcef2IMhPmvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xv4eCzcdsnV8E8HAzz4mVs3Ocv7rx2Q1rdoTZBegwJDV4ipEPVTYUsJ4auWQ6LCA/a7qmbY2bN3LtwrtZ0L8S300M865X/Y5fJ4I9NLjZGSbMOoc8SDwqIvTroRTmJTvMvep5BFbds/dIUwsrchYTh0CVlCZ8VMDhD1c5FV4OOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net; spf=pass smtp.mailfrom=gmail.com; dkim=fail (0-bit key) header.d=marliere.net header.i=@marliere.net header.b=I+XjgKvy reason="key not found in DNS"; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marliere.net header.i=@marliere.net header.b="I+XjgKvy"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso3826218a12.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 05 Feb 2024 05:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139718; x=1707744518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W/UWXvDehuAzmEaJp9X1jtQOE22goxFPbDZeyRn/Xhw=;
        b=touPDaDIRn3lhzY3vMSyr07H6Z8x6/sMdoku6cCLkQ+yc1+vYSVyCJY9LvYUbqpCKq
         MdmHpzeWRpwjOpmC2YScNz2fWLv3MxZR0JpQRnyqSd4Jak86/pw9/zI6QoN43X1Oq6XG
         i9Z2ck93wSIiV5FR4m6Sw0mgFbYW5C8ihKpekpm65gUqxHPEpvgndrf+11jIjsM8yYyZ
         kD6voOrPCs/Ob/1QNUN7kTEJ2Rm5Y7tO2FUzU+QNnS4WPMDfAiiNJodYMQrZNV5wnOcC
         lBbtpwb0l5Sq4+q8ktXlD93lLbwe+qXd8chG5Qz1wbvZWDJ40CMaGAa3jn07c1LhA/4C
         wfOA==
X-Gm-Message-State: AOJu0Yz+wZQUKFOdFwj9LwZW0D90DWk2w65Jvv0EkGWrAW68qaNcHjBW
	Y+xCAztoZgN00MJYJbL547RxUnR0pUOiZrkLcMMExNIVkGpo1hAXx1O897CbD4bWeQ==
X-Google-Smtp-Source: AGHT+IHQjCOy+KmWCH9bNPiqM4aoQ6Pf0MoL3sRigbdaydPmlVt6mDpxBRIXp+GLlHyha9b12AePqw==
X-Received: by 2002:a05:6a20:c896:b0:19e:8aa8:9b10 with SMTP id hb22-20020a056a20c89600b0019e8aa89b10mr3816878pzb.41.1707139717685;
        Mon, 05 Feb 2024 05:28:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXxSMyrLwwptXIQn2NdfF7abeKt/hVM6vO0HZq/cQWY57TJDw7PqbrpSsSkLCyj7cxiDUYvNPR8TxLX7GfH
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id 34-20020a630f62000000b005d8e30897e4sm6821456pgp.69.2024.02.05.05.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 05:28:37 -0800 (PST)
Date: Mon, 5 Feb 2024 10:29:06 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1707139715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W/UWXvDehuAzmEaJp9X1jtQOE22goxFPbDZeyRn/Xhw=;
	b=I+XjgKvyliuSdYHTUojAvxKoH0QYwTXyiaeb+WoCtpsswnGQ/hwrnokhqjGywy2gDavHAf
	af6lOuRpDiuXxwNUTjfgttO5NlQFuMrCR5CImcfgIouCIuX9h1eGuOrE186XyaI1JwfZvF
	Nn/+Rek0aRFqoH5I0a1qlsmWoUIvJ4xK7GsRKxjFm3ZSLsI8DG4+WVwRtR3ejz/bn2IK1r
	p5NCotnSFg0HrrEzBY5wzHg7rkNZAzIBsAztQSpjJ7LrzUz9u6KyT6Hr3kh/susS+FHJyW
	+RfenaBF9XJd8Mk719P/dk6eZ2mZyE/0aWI8sPrPteuna5jvZGTXOR+P1fP+vQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: Re: [tj-wq:for-6.9-bh-conversions 25/30] kernel/workqueue.c:6798:39:
 warning: passing argument 1 of 'subsys_virtual_register' discards 'const'
 qualifier from pointer target type
Message-ID: <jm3a2tdb36xvta3dqrhsfri5gorpdyv64ow4mgqw4va257lhfw@j67lckb5wcbe>
References: <202402051108.eqfecqfn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202402051108.eqfecqfn-lkp@intel.com>

On  5 Feb 11:50, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.9-bh-conversions
> head:   ae9075ec8b89e3a7581d525954c3b29267d56937
> commit: d412ace11144aa2bf692c7cf9778351efc15c827 [25/30] workqueue: make wq_subsys const
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240205/202402051108.eqfecqfn-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051108.eqfecqfn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402051108.eqfecqfn-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    kernel/workqueue.c: In function 'wq_sysfs_init':
> >> kernel/workqueue.c:6798:39: warning: passing argument 1 of 'subsys_virtual_register' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>     6798 |         err = subsys_virtual_register(&wq_subsys, NULL);
>          |                                       ^~~~~~~~~~
>    In file included from include/linux/node.h:18,
>                     from include/linux/cpu.h:17,
>                     from kernel/workqueue.c:36:
>    include/linux/device.h:77:46: note: expected 'struct bus_type *' but argument is of type 'const struct bus_type *'
>       77 | int subsys_virtual_register(struct bus_type *subsys,

I'm not sure how to flag this as invalid, since this is fixed already in
32f78abe59c7 ("driver core: bus: constantify subsys_register() calls")

>          |                             ~~~~~~~~~~~~~~~~~^~~~~~
> 
> 
> vim +6798 kernel/workqueue.c
> 
> b05a79280b346e Frederic Weisbecker 2015-04-27  6792  
> 6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  6793  static int __init wq_sysfs_init(void)
> 2d3854a37e8b76 Rusty Russell       2008-11-05  6794  {
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6795  	struct device *dev_root;
> b05a79280b346e Frederic Weisbecker 2015-04-27  6796  	int err;
> b05a79280b346e Frederic Weisbecker 2015-04-27  6797  
> b05a79280b346e Frederic Weisbecker 2015-04-27 @6798  	err = subsys_virtual_register(&wq_subsys, NULL);
> b05a79280b346e Frederic Weisbecker 2015-04-27  6799  	if (err)
> b05a79280b346e Frederic Weisbecker 2015-04-27  6800  		return err;
> b05a79280b346e Frederic Weisbecker 2015-04-27  6801  
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6802  	dev_root = bus_get_dev_root(&wq_subsys);
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6803  	if (dev_root) {
> fe28f631fa941f Waiman Long         2023-10-25  6804  		struct device_attribute *attr;
> fe28f631fa941f Waiman Long         2023-10-25  6805  
> fe28f631fa941f Waiman Long         2023-10-25  6806  		for (attr = wq_sysfs_cpumask_attrs; attr->attr.name; attr++) {
> fe28f631fa941f Waiman Long         2023-10-25  6807  			err = device_create_file(dev_root, attr);
> fe28f631fa941f Waiman Long         2023-10-25  6808  			if (err)
> fe28f631fa941f Waiman Long         2023-10-25  6809  				break;
> fe28f631fa941f Waiman Long         2023-10-25  6810  		}
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6811  		put_device(dev_root);
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6812  	}
> 686f669780276d Greg Kroah-Hartman  2023-03-13  6813  	return err;
> 2d3854a37e8b76 Rusty Russell       2008-11-05  6814  }
> 6ba94429c8e7b8 Frederic Weisbecker 2015-04-02  6815  core_initcall(wq_sysfs_init);
> 2d3854a37e8b76 Rusty Russell       2008-11-05  6816  
> 
> :::::: The code at line 6798 was first introduced by commit
> :::::: b05a79280b346eb24ddb73b39988398015291075 workqueue: Create low-level unbound workqueues cpumask
> 
> :::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
> :::::: CC: Tejun Heo <tj@kernel.org>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
