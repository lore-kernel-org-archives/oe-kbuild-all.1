Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EA82D948A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 09:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764234206; cv=none; b=PvIgCBSHLmOWuWeuOM+9GXTu9QPK88WxgDLEjeVIPgI0fmXu2+qcZMjmJvp6Bytl1M5qo3TSYoiRRD83dsXThmC9PzAWo1sYlyuBDoi2VPugzDrcQgCLS/++xb2P706IoaSgLsIqhfceZhRPoWcGQuvwUqHAx9SxQSkHU1mDmkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764234206; c=relaxed/simple;
	bh=5dlBU1bLUKAUPi8mZvwFnPI+FEnNq50B0iyUmI7CWlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ksKTSix3UGboQfdGq4TsdCCsWkziIXhDHbIsV3YcuNYVJxxJfByn6Ft7Xwlv6O6M5BmBijNMPJCnYIhG8nE47yPGLn+S+SsKITnVl6XaQXQsmt79kzSSp9h7R5Snz7OEBVEOFK9Mpmg/ycfOe9Zf8CWe5oYZicsHNKwRj61Prag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQzyVANG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQzyVANG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477770019e4so4175865e9.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Nov 2025 01:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764234202; x=1764839002; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6JdINPvofPb5s41JcK1QbCB8OCu8A4Xj8jHKRdhRQPg=;
        b=oQzyVANGPRvKUwoqIx/YPhK0dHsl8Fgil1KUMqFKpoAhYuyliXvRYXG6T3rZNsmz7l
         YdzLdI1ezbOUyY81x0kETm9ZigrRxlmoU9+wSzF6qnyDA0Wicd7C8gmxCtVgoh35aRpH
         pwhQKrByNay6UxfJHcKRAVqJhpP4dSwjthd9C8zFpX6vDQYZ3LUadYaud4ZJm1jY6PvC
         wZrFQR/BVPL/OZVuFxHUlbsUoy2jkOuoDuwFEH3udUDfcdCzG3bT4H9UyZEEFRDdp2Q9
         7IWKtA4zi18EfW56jdLnTXsw0+TClRTokgmPAUYfkPNVxjjRg2cNO5lrWBkUAWgVoqzA
         hhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764234202; x=1764839002;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JdINPvofPb5s41JcK1QbCB8OCu8A4Xj8jHKRdhRQPg=;
        b=f3oRka90DV8WOm5bqgmmv1VksLtjiAU3mxavG5MvQt26BhwnxmNe6/ol4zvxMYvMJg
         D+2bHeIeOY4gPAm4iWQa99K9ioAHIOIdhwlkd3Q6tTiMMcoZ+D4aTmo76IVHFQOwtMYR
         H7FPullVaufU7JAr7P8plStYigdShZ9kG/x2pVjUvBPEfLaBO+b8vwy+ZiR/Mw3B34vh
         6h6qHTt7xYcN0FtSA3YIcphyf8x0eeLABvvAFXbvennzXhVVEfs0lxVCgkvE561RkT3o
         QXAvqmof+vowh3fGSTJdctsrhRqqRqkaAZ2yqKN+FWRcoz1BaZEXuNUOpy8zoMbaKirV
         Le4w==
X-Forwarded-Encrypted: i=1; AJvYcCVtxTlZPwpNGVfI71+c5vyvv+BI2hyBETBT1DNopZEBQ+qSCsXkKGhuW0Qx7rEcxbZPv8j8tn/yoQmFs0vE@lists.linux.dev
X-Gm-Message-State: AOJu0YyEwVFPL0ZuTj5NA/8KSjHbndtnpeQ2Cljpyo8riZjkRdae+21Z
	3JWdylv7PobPaImWPWVUgcdgaMTni7Xn8iSeLq50ajZTm1lnqQD7jV4JwgnqosTIszQ=
X-Gm-Gg: ASbGncsBWI1LU+lnz+z+ORdWkS0MSNzx79YJS51XqLJc5TCHVuZVA6PZy/b+2G0aUtP
	bjd3g6h3XVH5P869++FVwICIdhqGtbYCNSm0NVqWol6GJkHdbCZ9Xt5ezn+cNVS8FaXk5GSocwH
	drgRX/39kcOGgxRBOyXg9qDDwLEyVuWOXM//SAfzQQOwZaIbGWi6DKWL9d+b5Zc3zD1Yll5EkO4
	fqcduwWrRC+YFdbWNy5VIRJZ8GE5AQDcNYgjAKASNyQTYpR61I07Ur4/M0qaGuyUsv0yh0DeRhG
	EpUImaauZLi36FXnGr1vjl63FAQh5hG7wJVFg5sbmnyp7y72a7qhJMiZlY0cW7z0P3xjnEPyp2w
	Et8dVphtpLIeFw/aGkir3tO8tPxc/9S0aFGT6yswh0cSSSlKGgvfWnBIpLrGVQPp+DQY/rnJjvt
	+Dg5zj/d5ModF/FAf4
X-Google-Smtp-Source: AGHT+IFynb9zZlTb1lIry0GmIiL8O+WRck+Tqg2z+IEv8rbf/6IV831qOuOuCwUdLqEfTBJoUemWKQ==
X-Received: by 2002:a05:600c:1c87:b0:477:98f7:2aec with SMTP id 5b1f17b1804b1-47904acef12mr111071645e9.3.1764234201059;
        Thu, 27 Nov 2025 01:03:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4791116c3c0sm20418605e9.8.2025.11.27.01.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:03:20 -0800 (PST)
Date: Thu, 27 Nov 2025 12:03:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Conor Dooley <conor+lkp@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 21/23] drivers/pinctrl/pinctrl-generic.c:183
 pinctrl_generic_pins_function_dt_node_to_map() error: uninitialized symbol
 'map'.
Message-ID: <202511271435.oSbNsRD6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a88950bbbc80fe53e2c773353674604d3130c443
commit: c5d18e566a49f4f9a50575259bbdda2118b000e4 [21/23] pinctrl: add polarfire soc mssio pinctrl driver
config: powerpc64-randconfig-r072-20251127 (https://download.01.org/0day-ci/archive/20251127/202511271435.oSbNsRD6-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202511271435.oSbNsRD6-lkp@intel.com/

New smatch warnings:
drivers/pinctrl/pinctrl-generic.c:183 pinctrl_generic_pins_function_dt_node_to_map() error: uninitialized symbol 'map'.

vim +/map +183 drivers/pinctrl/pinctrl-generic.c

df80616e3dbbe3 Conor Dooley 2025-11-26  111  int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctldev,
df80616e3dbbe3 Conor Dooley 2025-11-26  112  						 struct device_node *np,
df80616e3dbbe3 Conor Dooley 2025-11-26  113  						 struct pinctrl_map **maps,
df80616e3dbbe3 Conor Dooley 2025-11-26  114  						 unsigned int *num_maps)
df80616e3dbbe3 Conor Dooley 2025-11-26  115  {
df80616e3dbbe3 Conor Dooley 2025-11-26  116  	struct device *dev = pctldev->dev;
df80616e3dbbe3 Conor Dooley 2025-11-26  117  	struct device_node *child_np;
df80616e3dbbe3 Conor Dooley 2025-11-26  118  	struct pinctrl_map *map;

map needs to be set to NULL at the start.  We pass it to
krealloc_array().

df80616e3dbbe3 Conor Dooley 2025-11-26  119  	const char **group_names;
df80616e3dbbe3 Conor Dooley 2025-11-26  120  	unsigned int num_reserved_maps = 0;
df80616e3dbbe3 Conor Dooley 2025-11-26  121  	int ngroups = 0;
df80616e3dbbe3 Conor Dooley 2025-11-26  122  	int ret;
df80616e3dbbe3 Conor Dooley 2025-11-26  123  
df80616e3dbbe3 Conor Dooley 2025-11-26  124  	*maps = NULL;
df80616e3dbbe3 Conor Dooley 2025-11-26  125  	*num_maps = 0;
df80616e3dbbe3 Conor Dooley 2025-11-26  126  
df80616e3dbbe3 Conor Dooley 2025-11-26  127  	/*
df80616e3dbbe3 Conor Dooley 2025-11-26  128  	 * Check if this is actually the pins node, or a parent containing
df80616e3dbbe3 Conor Dooley 2025-11-26  129  	 * multiple pins nodes.
df80616e3dbbe3 Conor Dooley 2025-11-26  130  	 */
df80616e3dbbe3 Conor Dooley 2025-11-26  131  	if (!of_property_present(np, "pins"))
df80616e3dbbe3 Conor Dooley 2025-11-26  132  		goto parent;
df80616e3dbbe3 Conor Dooley 2025-11-26  133  
df80616e3dbbe3 Conor Dooley 2025-11-26  134  	group_names = devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
df80616e3dbbe3 Conor Dooley 2025-11-26  135  	if (!group_names)
df80616e3dbbe3 Conor Dooley 2025-11-26  136  		return -ENOMEM;
df80616e3dbbe3 Conor Dooley 2025-11-26  137  
df80616e3dbbe3 Conor Dooley 2025-11-26  138  	ret = pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, np,
df80616e3dbbe3 Conor Dooley 2025-11-26  139  							      &map,num_maps,
df80616e3dbbe3 Conor Dooley 2025-11-26  140  							      &num_reserved_maps,
df80616e3dbbe3 Conor Dooley 2025-11-26  141  							      group_names,
df80616e3dbbe3 Conor Dooley 2025-11-26  142  							      ngroups);
df80616e3dbbe3 Conor Dooley 2025-11-26  143  	if (ret) {
df80616e3dbbe3 Conor Dooley 2025-11-26  144  		pinctrl_utils_free_map(pctldev, map, *num_maps);
df80616e3dbbe3 Conor Dooley 2025-11-26  145  		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", np->name);
df80616e3dbbe3 Conor Dooley 2025-11-26  146  	}
df80616e3dbbe3 Conor Dooley 2025-11-26  147  
df80616e3dbbe3 Conor Dooley 2025-11-26  148  	ret = pinmux_generic_add_function(pctldev, np->name, group_names, 1, NULL);
df80616e3dbbe3 Conor Dooley 2025-11-26  149  	if (ret < 0) {
df80616e3dbbe3 Conor Dooley 2025-11-26  150  		pinctrl_utils_free_map(pctldev, map, *num_maps);
df80616e3dbbe3 Conor Dooley 2025-11-26  151  		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
df80616e3dbbe3 Conor Dooley 2025-11-26  152  	}
df80616e3dbbe3 Conor Dooley 2025-11-26  153  
df80616e3dbbe3 Conor Dooley 2025-11-26  154  	*maps = map;
df80616e3dbbe3 Conor Dooley 2025-11-26  155  
df80616e3dbbe3 Conor Dooley 2025-11-26  156  	return 0;
df80616e3dbbe3 Conor Dooley 2025-11-26  157  
df80616e3dbbe3 Conor Dooley 2025-11-26  158  parent:
df80616e3dbbe3 Conor Dooley 2025-11-26  159  	for_each_available_child_of_node(np, child_np)
df80616e3dbbe3 Conor Dooley 2025-11-26  160  		ngroups += 1;
df80616e3dbbe3 Conor Dooley 2025-11-26  161  
df80616e3dbbe3 Conor Dooley 2025-11-26  162  	group_names = devm_kcalloc(dev, ngroups, sizeof(*group_names), GFP_KERNEL);
df80616e3dbbe3 Conor Dooley 2025-11-26  163  	if (!group_names)
df80616e3dbbe3 Conor Dooley 2025-11-26  164  		return -ENOMEM;
df80616e3dbbe3 Conor Dooley 2025-11-26  165  
df80616e3dbbe3 Conor Dooley 2025-11-26  166  	ngroups = 0;
df80616e3dbbe3 Conor Dooley 2025-11-26  167  	for_each_available_child_of_node_scoped(np, child_np) {
df80616e3dbbe3 Conor Dooley 2025-11-26  168  		ret = pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, child_np,
df80616e3dbbe3 Conor Dooley 2025-11-26  169  								      &map,num_maps,
df80616e3dbbe3 Conor Dooley 2025-11-26  170  								      &num_reserved_maps,
df80616e3dbbe3 Conor Dooley 2025-11-26  171  								      group_names,
df80616e3dbbe3 Conor Dooley 2025-11-26  172  								      ngroups);
df80616e3dbbe3 Conor Dooley 2025-11-26  173  		if (ret) {
df80616e3dbbe3 Conor Dooley 2025-11-26  174  			pinctrl_utils_free_map(pctldev, map, *num_maps);
df80616e3dbbe3 Conor Dooley 2025-11-26  175  			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", np->name);
df80616e3dbbe3 Conor Dooley 2025-11-26  176  		}
df80616e3dbbe3 Conor Dooley 2025-11-26  177  
df80616e3dbbe3 Conor Dooley 2025-11-26  178  		ngroups++;
df80616e3dbbe3 Conor Dooley 2025-11-26  179  	}
df80616e3dbbe3 Conor Dooley 2025-11-26  180  
df80616e3dbbe3 Conor Dooley 2025-11-26  181  	ret = pinmux_generic_add_function(pctldev, np->name, group_names, ngroups, NULL);
df80616e3dbbe3 Conor Dooley 2025-11-26  182  	if (ret < 0) {
df80616e3dbbe3 Conor Dooley 2025-11-26 @183  		pinctrl_utils_free_map(pctldev, map, *num_maps);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

