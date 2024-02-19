Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AB33CF48
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708358582; cv=none; b=u1QkQpsw8tJYeUBKKDfsbYcfzgRl/AYD2IxGZZDtMnLYzAE2BHTMe7J+epardgJ8inZvI1aMaPcfVLnuRr0Zcx324ln3ntbzUlzDoFNtCmrYI2KoDnu/watFeY8DVHdzCpJJ8EzUptU93u0U1n2uiWwhQ79pgY9JaFzE28ZdC1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708358582; c=relaxed/simple;
	bh=H7a7oxGIhcPoePflp6S4fyhD8pvwns8xgugWsQFM2lo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZxYfPMDMZ8VuLcjU+GjZfyUAkCy2vGZKyLE54sqUUZejCwEe2VWiv/EM825Y7PaC5CMcG0MYgOx1UOhkkmcQet36L9yTlxDqk3eiKo9r8pot2MThflPbl+ycpUr9A4y8snoR+Gq1i0RMto8fpzXVrsxkIwBT9jjYtR1UXR4Hrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lRL3/ISR; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lRL3/ISR"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5649eb3ab68so1024508a12.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 08:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708358578; x=1708963378; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flIDH9HO3xRQn7HXwVHxFPU5p6Nmkq+1BWuk0uOwwP4=;
        b=lRL3/ISRG2cqPO64F6zgJRhwKn2mBqJ3LxaKv5BhTmXcVoY+0phUWRY+ZgK/DcodbG
         wBE3g8FuoE9rnZZDTqj941dJ/WHDkfe6lLSPamiIduP94wiPUs7pa9Krck1UKgEtaUvi
         lzbORKFKlQVBYWN1b3bswvjRH1lcescEol/hVNTQDuKA35QUutIYZiFMciA2yWHj1yZr
         DvcBtO50HZJVbIO0FWmTo1GzQf+YNwPOOzQo1+o9kkHkoem2bo2HjFMZgR6Ufu7reh8k
         rcFa5ZQxzQ+tIJzp+5BWrRwIoH67x97T2JTdDFJk846OMdeiv48h0NOphtHGoDHvud4u
         13lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708358578; x=1708963378;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flIDH9HO3xRQn7HXwVHxFPU5p6Nmkq+1BWuk0uOwwP4=;
        b=uxlhUBLBw6oOf1NBXLJGGiFzbMjBUIbhO2BKLqGeLjeLx9tn2RjBsHGoQ3UBV9UCxO
         /w3PBVfIHlF9uXpE3Ii79sdqLSwqwcmUJPjQgh/ND7B5hRogthw8ISrIXH5j6KoITr1C
         KQ5NeSIkkNTL308qGxr+RVtIcb/t99SEGmwfIl58Agfs/w6q7wmaJ53olDC/QSIZ7H2r
         2/V6xB8Jqynp3kUdJDGezdB8v7XkVnisOSqlpMNJSK8bXH3LcxaQlfl9NZCi+8ubl95B
         NxoIKaxrhDDlXC+Iu/kNOOI6BHBX5selNy7ycCm5MgD7EydCajL62QXM0ZJ8CelIeZ2H
         D4qA==
X-Forwarded-Encrypted: i=1; AJvYcCVW7r6C1DcMlWz7VvGKCbBwYA5UnEk7zT2ex5+oI99I/5gd0cgakXvvgCS0almanvuTcqxKPF5kFmfDyay2rgtLcPueIGFNcJ3W6o53pw==
X-Gm-Message-State: AOJu0YzcOLiCxEazgDyvAiRGANb5+lTSXAi6Iwax7T2XWZ0PT9UIPdbn
	hA16+SU3jSy6IpIIWhgBx8xtUvwKya8GYVlf0jLVnJ6+xRZHcop99jvMX0rrx98=
X-Google-Smtp-Source: AGHT+IE+YaDuZFmXjPwyrRtGnEplalyw3dM+flqDJX0KkpO+iwdZ4pAD3NzGtUm3A059UMZMqNelCA==
X-Received: by 2002:a17:906:2b50:b0:a3e:9d49:6c8c with SMTP id b16-20020a1709062b5000b00a3e9d496c8cmr1654211ejg.36.1708358578349;
        Mon, 19 Feb 2024 08:02:58 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id un8-20020a170907cb8800b00a3df7003552sm3075785ejc.32.2024.02.19.08.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 08:02:58 -0800 (PST)
Date: Mon, 19 Feb 2024 19:02:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Dorcas Anono Litunya <anonolitunya@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:outreachy-vivid-v6.7 12/12]
 drivers/media/test-drivers/vivid/vivid-core.c:2200 vivid_init() error:
 uninitialized symbol 'ret'.
Message-ID: <2e9c4286-653a-4520-a90d-39bd6636990c@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git outreachy-vivid-v6.7
head:   4bc7849217d6c105cb59d78e9995b8e129f0deaf
commit: 4bc7849217d6c105cb59d78e9995b8e129f0deaf [12/12] media: vivid: Update menu controls for HDMI in multiple instance
config: nios2-randconfig-r071-20240219 (https://download.01.org/0day-ci/archive/20240219/202402192316.fyBF9GDv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202402192316.fyBF9GDv-lkp@intel.com/

New smatch warnings:
drivers/media/test-drivers/vivid/vivid-core.c:2200 vivid_init() error: uninitialized symbol 'ret'.

vim +/ret +2200 drivers/media/test-drivers/vivid/vivid-core.c

f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2159  static int __init vivid_init(void)
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2160  {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2161  	int count = FIXED_MENU_ITEMS;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2162  	int ret;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2163  
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2164  	for (int i = 0; i < n_devs; i++) {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2165  		if (!(node_types[i] & (1 << 8)))
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2166  			continue;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2167  		for (int j = 0, k = 0; j < num_outputs[i] &&
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2168  		     count < MAX_MENU_ITEMS; ++j) {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2169  			if (!(output_types[i] & BIT(j)))
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2170  				continue;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2171  			vivid_ctrl_hdmi_to_output_strings[count] =
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2172  				kmalloc(MAX_STRING_LENGTH, GFP_KERNEL);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2173  			if (!vivid_ctrl_hdmi_to_output_strings[count])
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2174  				goto cleanup;

"ret" is uninitialized

4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2175  			if (n_devs == 1) {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2176  				snprintf(vivid_ctrl_hdmi_to_output_strings[count],
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2177  					 MAX_STRING_LENGTH, "HDMI %d", k);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2178  			} else {
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2179  				snprintf(vivid_ctrl_hdmi_to_output_strings[count],
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2180  					 MAX_STRING_LENGTH, "HDMI %03d-%d", i, k);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2181  			}
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2182  			k++;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2183  			count++;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2184  		}
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2185  	}
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2186  	ret = platform_device_register(&vivid_pdev);
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2187  	if (ret)
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2188  		goto cleanup;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2189  	ret = platform_driver_register(&vivid_pdrv);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2190  	if (ret) {
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2191  		platform_device_unregister(&vivid_pdev);
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2192  		goto cleanup;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2193  	}
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2194  	return ret;
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2195  
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2196  cleanup:
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2197  	for (int i = FIXED_MENU_ITEMS; i < MAX_MENU_ITEMS; i++)
4bc7849217d6c1 drivers/media/test-drivers/vivid/vivid-core.c Dorcas Anono Litunya 2024-02-06  2198  		kfree(vivid_ctrl_hdmi_to_output_strings[i]);
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2199  
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13 @2200  	return ret;
f46d740fb02589 drivers/media/platform/vivid/vivid-core.c     Hans Verkuil         2015-03-13  2201  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

