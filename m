Received: from mail-m49204.qiye.163.com (mail-m49204.qiye.163.com [45.254.49.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A7C18B477
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Feb 2025 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738833371; cv=none; b=kAWNJskS/3OAZ6M3jDEAbj4IZPUTYqnvphCbPJ3qTq76CCko5oTEUJVH9lA+O8R5T5nQG8D+TFRebkApYlGbxDQJGQRUV11CL5fFpUZrZ5KN2oAHDhd2MLx9zT4V/q6TnX6F3TucqSkeEPSC8Hn4NyKXCai5pj43lesHTTq9cug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738833371; c=relaxed/simple;
	bh=UUe7zqsK9R8R0GZjgCi/GJIsPenPnBTS936aWBRKrc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NXuM5nj976ibwpJoli42zIAbPRKzNr4HNbQPXsAwN/1DA4HBF5hW13ZS7jK5EfLEaX9oKpM+uIYe2j1L7ijNfheTLDowAOriKe8Sf3oXO9p4icYfRYEqzG06v9ByGTTWbaopXqguLn2iFkv2y41DXvKw3xoxYNsOxdoK6z5pEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn; spf=pass smtp.mailfrom=cqsoftware.com.cn; dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b=fFR6cGq9; arc=none smtp.client-ip=45.254.49.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cqsoftware.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cqsoftware.com.cn header.i=@cqsoftware.com.cn header.b="fFR6cGq9"
Received: from [192.168.6.2] (unknown [1.193.57.36])
	by smtp.qiye.163.com (Hmail) with ESMTP id a5118189;
	Thu, 6 Feb 2025 17:10:51 +0800 (GMT+08:00)
Message-ID: <52f55e71-c48e-45fd-8d5e-876264cc1fc7@cqsoftware.com.cn>
Date: Thu, 6 Feb 2025 17:10:50 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [lwn:docs-next 9/11] htmldocs: Warning:
 Documentation/translations/zh_CN/security/credentials.rst references a file
 that doesn't exist: Documentation/translations/zh_CN/security/keys/*
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Yanteng Si <si.yanteng@linux.dev>,
 Alex Shi <alexs@kernel.org>
References: <202502050403.uFwUnStI-lkp@intel.com>
From: zhaoshuo <zhaoshuo@cqsoftware.com.cn>
In-Reply-To: <202502050403.uFwUnStI-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTh1PVkoYTkhCH05KQx4YTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKVUpCSFVOTFVITVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
X-HM-Tid: 0a94da86c07b09d0kunma5118189
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Myo6CSo4ETIJSwgvDxoTKiMc
	Dj4wFBZVSlVKTEhDQ0hIS05JTEhIVTMWGhIXVQETGhQIEw4UOxgKCBQdDwwaCR5VGBQWVRgVRVlX
	WRILWUFZSlVKQkhVTkxVSE1ZV1kIAVlBSU9JQjcG
DKIM-Signature:a=rsa-sha256;
	b=fFR6cGq9eJOcdeLcxiyLxH0B/Qm9+JnAfg0obiDaMYiGwJsCpMveo3+tWuxQXBtD1qwG9Bz7d7M1cX782OG15xsUXoM+qLBwtsfB0ZEyN1EQB/FNxLDgMORrnrTGV8jsCSZKrsE6DcNb1g1BPzlHuo2wut8Lwdo3naMMzr1cYp0=; c=relaxed/relaxed; s=default; d=cqsoftware.com.cn; v=1;
	bh=cyRk1f9a3qigXehXxrwyIBWgGE9b9zqiTJzAb5RTp18=;
	h=date:mime-version:subject:message-id:from;


在 2025/2/5 4:55, kernel test robot 写道:
> tree:   git://git.lwn.net/linux.git docs-next
> head:   e8bcda12176c47f2ce6c5104955845d028a640e8
> commit: f5c7cc77acf5abebc5aec4f4236954c23f29e09b [9/11] docs/zh_CN: Add security credentials Chinese translation
> reproduce: (https://download.01.org/0day-ci/archive/20250205/202502050403.uFwUnStI-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502050403.uFwUnStI-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>     Warning: Documentation/hwmon/g762.rst references a file that doesn't exist: Documentation/devicetree/bindings/hwmon/g762.txt
>     Warning: Documentation/translations/ja_JP/SubmittingPatches references a file that doesn't exist: linux-2.6.12-vanilla/Documentation/dontdiff
>     Warning: Documentation/translations/zh_CN/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
>     Warning: Documentation/translations/zh_CN/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>>> Warning: Documentation/translations/zh_CN/security/credentials.rst references a file that doesn't exist: Documentation/translations/zh_CN/security/keys/*



Ok，This document will be added later.

Thanks，

ZhaoShuo

>     Warning: Documentation/translations/zh_TW/admin-guide/README.rst references a file that doesn't exist: Documentation/dev-tools/kgdb.rst
>     Warning: Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst references a file that doesn't exist: Documentation/dev-tools/gdb-kernel-debugging.rst
>     Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/fsl,qoriq-mc.txt
>     Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
>     Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/fault-injection/fault-injection.rst
>
