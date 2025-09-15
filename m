Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9893C27FD46
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757917220; cv=none; b=dyH+LPzYo8jUr9QOqVOl9Lntx8kRmVe9yssZ8uw8EXkLvMFXGfMMGxNHtcjHUe4OGLvlK7icnUpFdRK8qxqiWXsYXG4YmA4rZfC9SdY5d3/UsyAOd4kNU000WKRnthHfCMVKag4DkZao/klkimckUiTAxUr/vMkdYhreu38a4tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757917220; c=relaxed/simple;
	bh=vva6pIwIf3d2mZtlJF6HKg5UB//x7948Lc30IK2Mdek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=R5+JyF5/qk5zCaPGIqN3CaV8nFJT2h4f0igvDv8FHSwmvUJzYLdfrlw2Taz++kKjAnBsbB9nvnjfOSf1mvffgZKGs3yhWlRIOORizNgparOR2PfX5xIE2G2VUEnYQkxNhO5KqcXxGkm2nUrNqAqWa8Oygy2dA32pJz14XRQw6w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qk5FjaMF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qk5FjaMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757917216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9cBtHKBe6RRB8Snk7hpO1mjWCGkijKsQ31tvgy2vEzE=;
	b=Qk5FjaMFFz47s8zMcazcG+eLpj9pOno6+YtjDmQODpFIWTUtB/0wZEyin9bCQfMtGtcc/o
	5PgRzSAmyNx9JfpK2zd5lCnUVzWXRkjM0GIqFCivnPw36OX85VRalyVgNBSrJaCTAglwbF
	bHFm/oPOYddyZxAErZLB7RcwPzdNfto=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-rJh0ytOXMFmVBcJts1Sqog-1; Mon, 15 Sep 2025 02:20:15 -0400
X-MC-Unique: rJh0ytOXMFmVBcJts1Sqog-1
X-Mimecast-MFC-AGG-ID: rJh0ytOXMFmVBcJts1Sqog_1757917214
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7725a76dcb4so2831021b3a.0
        for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Sep 2025 23:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757917214; x=1758522014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cBtHKBe6RRB8Snk7hpO1mjWCGkijKsQ31tvgy2vEzE=;
        b=DmcvIIEqqTnZhbl877xlmyl08g4WttWDdANND+lH7yng82NbxlThtVswIUTGNPTUNW
         OkNUNrLKp0yIha1Avd4csvgG41peL7ToWuhDDNwjjNjEWRdoIcMZf0UENKklHdQgIeYE
         raoZuTqkaKIgQwdZ7QPrmFuaiA0db2TDTdXENKwDQE9iThnWrwgOKKSeppTwifLnL9Zi
         iJfi6V7cPJQHPnOIvjTeYsGcAqMhCwLQWMUdYTGNC4x0T+oERiqdSYyzYaDFJUt6Pgcr
         NHVa4QwBVziI1A73Jdtas2GAthi2dvfVe2R6JuuInd1fL/qYiEMvcLNOMIpJ9Q3ms53m
         zueQ==
X-Forwarded-Encrypted: i=1; AJvYcCViUCIoVtUCKfhMp9iSonGkSdsrc4+APaL+NwrdRNf5NdLgqmywggwmjTECHuVhI+fvknA9hEO2op0b89+h@lists.linux.dev
X-Gm-Message-State: AOJu0YzptXfRSbnaxUSpRXIZ42CxuqFV2+Lz3oRRRf+9/2d5sJMUDLRs
	34BH8gQN7TiMRgDWH9uwEKC6YBU2jae5QMNZZCXx4siAQTo4hfq9OZYO4geb62nibnnBDnSiJg3
	QeD+6UAVvQYGrBoi603ekXabsFj8oAmMlCBskbupkw5SWULSQIA2fMzQQ9nBj70IESa8=
X-Gm-Gg: ASbGncuYUvZXfMuVZRP+tp39vFCULHsBuwr3d9cW2sMynmJUoUgz5Uto/GBF2AK/7az
	MBg+G9SLDZFzgAcmNWyB/Bad3kdQ9N+/6U/JE2uAMeRDXr5bzQL+XVaplJ3Se7bOyfSoMP6z+1l
	vOqZel+uFGPZHcf0FRw4WWTzY5Cuif7+55hg7CNHb5TlL0GLFZiKyyfdKgnX77j15QLgX3M7Jgd
	svXmfIFYZfv/9xSdkFMonfiT6xMKnXNRaFrFnGu4OravXtg9cfbFvF+XDgzD45fjBWPF4y3zSDc
	HvjuS+vKd2KrufZ2KpI3pkZIiyWqjBc=
X-Received: by 2002:a05:6a20:7d86:b0:243:b92d:72c1 with SMTP id adf61e73a8af0-25cdefc7abbmr21753638637.0.1757917214014;
        Sun, 14 Sep 2025 23:20:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErivlYOqYNMD1uzOOLvIYOeSFyGjheTCp4Vv8Fmhsfn/ts4DA9nnO0VA6qrA0q8hxFLJc/yg==
X-Received: by 2002:a05:6a20:7d86:b0:243:b92d:72c1 with SMTP id adf61e73a8af0-25cdefc7abbmr21753609637.0.1757917213616;
        Sun, 14 Sep 2025 23:20:13 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54b169f2edsm7546506a12.19.2025.09.14.23.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 23:20:13 -0700 (PDT)
Date: Mon, 15 Sep 2025 14:17:51 +0800
From: Coiby Xu <coxu@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: kexec@lists.infradead.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, fuqiang wang <fuqiang.wang@easystack.cn>, x86@kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Linux Memory Management List <linux-mm@kvack.org>, 
	Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] crash: Add KUnit tests for crash_exclude_mem_range
Message-ID: <x33mpzp6bhnx2awnszjymuyfhgmtvq5hhfs6aoyvuoo6opsbqr@tkegmqv3lucp>
References: <20250904093855.1180154-2-coxu@redhat.com>
 <202509090415.cOytgte4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202509090415.cOytgte4-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PkjxEp1Dqyip2j33mc95wdWa6L2z9hi4h-MLdDFBVyI_1757917214
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Sep 09, 2025 at 05:25:17AM +0800, kernel test robot wrote:
>Hi Coiby,

Hi,

>
>kernel test robot noticed the following build errors:
>
>[auto build test ERROR on b320789d6883cc00ac78ce83bccbfe7ed58afcf0]
>
>url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/crash-Add-KUnit-tests-for-crash_exclude_mem_range/20250904-174105
>base:   b320789d6883cc00ac78ce83bccbfe7ed58afcf0
>patch link:    https://lore.kernel.org/r/20250904093855.1180154-2-coxu%40redhat.com
>patch subject: [PATCH v6 2/2] crash: Add KUnit tests for crash_exclude_mem_range
>config: x86_64-randconfig-073-20250908 (https://download.01.org/0day-ci/archive/20250909/202509090415.cOytgte4-lkp@intel.com/config)
>compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
>reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090415.cOytgte4-lkp@intel.com/reproduce)
>
>If you fix the issue in a separate patch/commit (i.e. not just a new version of
>the same patch/commit), kindly add following tags
>| Reported-by: kernel test robot <lkp@intel.com>
>| Closes: https://lore.kernel.org/oe-kbuild-all/202509090415.cOytgte4-lkp@intel.com/
>
>All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: "crash_exclude_mem_range" [kernel/crash_core_test.ko] undefined!

Thanks for reporting this problem. This issue has already been fixed by
Andrew [1][2] earlier.

This issue happens because the KUnit tests can be built and run as a
kernel module. 

[1] https://lore.kernel.org/mm-commits/20250905031921.E0A26C4CEF0@smtp.kernel.org/
[2] https://lore.kernel.org/mm-commits/20250914001748.77104C4CEEB@smtp.kernel.org/

>
>-- 
>0-DAY CI Kernel Test Service
>https://github.com/intel/lkp-tests/wiki
>

-- 
Best regards,
Coiby

