Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4C1119
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 May 2023 06:45:31 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f41d087b3bso67044485e9.0
        for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 23:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683873929; x=1686465929;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zl+9oz5srM0EyP4DCoS/xfZY5XSwNtPCz7TdX6Slq+k=;
        b=JUUlU/QHDrKZv9nhRDpwpPkG6d1CcTIOWuUgsOWF8rfxQdh6MfTzGA/wRBYCkt/w+p
         T21vpBuzi8qZTsTxv8zz3aI58Z51rzxeHGtyNgHk0Q8xVptLpWireL29ukvTSQ+i/8GB
         Zku/mFzudBAv+uQIeIDVE7Iui5vmPgwK0uAOMc1s0itBevDiR0jxolWByGFLCZnh8EcU
         1+IB1ILgjUYzYfCx+eqBXWRDBiUJQgdHnMzDI9qxrq1/IJs7rfXLKMzhnvZKI7kIZ7hk
         F2V8sMSauD5N4D7kGNdepzq3LuHrcwejr89Ne3E1/1U/FUW4QrgzvPbYsf89yxeCy499
         aYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683873929; x=1686465929;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zl+9oz5srM0EyP4DCoS/xfZY5XSwNtPCz7TdX6Slq+k=;
        b=f64r6+WKGIYRGLwP1A34bTWWWsJtkrQwMu7rJY/DfJ562+VQ1qk3D7KCfFqpG3tSAm
         aaN499lsNy2If90UhmKbKRj4ZKmAZjqCrE+o23HvHksUYFD1V44+0XTsMNftrDJ+nbj+
         EpohbHNg3yXp4w9k8O+QgcXSrL43XO8KsUYAcidQgfyeBm5LIU/NevXHmtfKu00flLwm
         9RoMSsDupUBGFEgH5uJ9390rSYT6snB646oL9G07FNRTcbdZ5H/vt+MvqN08q7WpwEQH
         /9Vh6HXykFdE7/Db0tAnlg/3QwU5gy5R0V0t04k4eIwTR/STx55F8TvaQe22aERD2l8q
         Me+A==
X-Gm-Message-State: AC+VfDxRI5EXD9re6u4vt2rCW+UahCGPlXfOFmXUHZeNsMGDMi5wm4vP
	9vnYG46AGLMrICWERCoa5rkCQg==
X-Google-Smtp-Source: ACHHUZ4IxV15Q2ppxHqzWEYY8M2zJmA55jGBf/0CXfq2ilKiTqy/g+mA9cTPFcWFvOftHdQ8YnWOIA==
X-Received: by 2002:a05:600c:21c1:b0:3f4:21ff:b91f with SMTP id x1-20020a05600c21c100b003f421ffb91fmr12109654wmj.28.1683873929541;
        Thu, 11 May 2023 23:45:29 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j15-20020a05600c1c0f00b003f1738d0d13sm14574276wms.1.2023.05.11.23.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 23:45:28 -0700 (PDT)
Date: Fri, 12 May 2023 09:45:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Jiang <dave.jiang@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl-qtg 24/30] drivers/cxl/port.c:88
 cxl_port_perf_data_calculate() error: we previously assumed 'cxl_root->ops'
 could be null (see line 88)
Message-ID: <030cc44e-dcf2-4d7c-8d7d-088505353d89@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl-qtg
head:   fd35584ec7147f575dcdc65239bc8ac7fe340ab4
commit: 6f49d1fab777d2585dae7c6ab7e228f540f190d4 [24/30] cxl: Compute the entire CXL path latency and bandwidth data
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230512/202305121309.xPoqnmIY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305121309.xPoqnmIY-lkp@intel.com/

smatch warnings:
drivers/cxl/port.c:88 cxl_port_perf_data_calculate() error: we previously assumed 'cxl_root->ops' could be null (see line 88)

vim +88 drivers/cxl/port.c

6f49d1fab777d2 Dave Jiang 2022-12-05   70  static int cxl_port_perf_data_calculate(struct cxl_port *port,
6f49d1fab777d2 Dave Jiang 2022-12-05   71  					struct list_head *dsmas_list)
6f49d1fab777d2 Dave Jiang 2022-12-05   72  {
6f49d1fab777d2 Dave Jiang 2022-12-05   73  	struct access_coordinate c;
6f49d1fab777d2 Dave Jiang 2022-12-05   74  	struct qtg_dsm_input input;
6f49d1fab777d2 Dave Jiang 2022-12-05   75  	struct cxl_port *root_port;
6f49d1fab777d2 Dave Jiang 2022-12-05   76  	struct cxl_root *cxl_root;
6f49d1fab777d2 Dave Jiang 2022-12-05   77  	struct dsmas_entry *dent;
6f49d1fab777d2 Dave Jiang 2022-12-05   78  	int rc, qos_class;
6f49d1fab777d2 Dave Jiang 2022-12-05   79  
6f49d1fab777d2 Dave Jiang 2022-12-05   80  	rc = cxl_endpoint_get_perf_coordinates(port, &c);
6f49d1fab777d2 Dave Jiang 2022-12-05   81  	if (rc) {
6f49d1fab777d2 Dave Jiang 2022-12-05   82  		dev_dbg(&port->dev, "Failed to retrieve perf coordinates.\n");
6f49d1fab777d2 Dave Jiang 2022-12-05   83  		return rc;
6f49d1fab777d2 Dave Jiang 2022-12-05   84  	}
6f49d1fab777d2 Dave Jiang 2022-12-05   85  
6f49d1fab777d2 Dave Jiang 2022-12-05   86  	root_port = find_cxl_root(port);
6f49d1fab777d2 Dave Jiang 2022-12-05   87  	cxl_root = to_cxl_root(root_port);
6f49d1fab777d2 Dave Jiang 2022-12-05  @88  	if (!cxl_root->ops && !cxl_root->ops->get_qos_class)

&& vs ||.

6f49d1fab777d2 Dave Jiang 2022-12-05   89  		return -EOPNOTSUPP;
6f49d1fab777d2 Dave Jiang 2022-12-05   90  
6f49d1fab777d2 Dave Jiang 2022-12-05   91  	list_for_each_entry(dent, dsmas_list, list) {
6f49d1fab777d2 Dave Jiang 2022-12-05   92  		dent->coord.read_latency = dent->coord.read_latency +
6f49d1fab777d2 Dave Jiang 2022-12-05   93  					   c.read_latency;
6f49d1fab777d2 Dave Jiang 2022-12-05   94  		dent->coord.write_latency = dent->coord.write_latency +
6f49d1fab777d2 Dave Jiang 2022-12-05   95  					    c.write_latency;
6f49d1fab777d2 Dave Jiang 2022-12-05   96  		dent->coord.read_bandwidth = min_t(int, c.read_bandwidth,
6f49d1fab777d2 Dave Jiang 2022-12-05   97  						   dent->coord.read_bandwidth);
6f49d1fab777d2 Dave Jiang 2022-12-05   98  		dent->coord.write_bandwidth = min_t(int, c.write_bandwidth,
6f49d1fab777d2 Dave Jiang 2022-12-05   99  						    dent->coord.write_bandwidth);
6f49d1fab777d2 Dave Jiang 2022-12-05  100  
6f49d1fab777d2 Dave Jiang 2022-12-05  101  		input.rd_lat = cpu_to_le32(dent->coord.read_latency);
6f49d1fab777d2 Dave Jiang 2022-12-05  102  		input.wr_lat = cpu_to_le32(dent->coord.write_latency);
6f49d1fab777d2 Dave Jiang 2022-12-05  103  		input.rd_bw = cpu_to_le32(dent->coord.read_bandwidth);
6f49d1fab777d2 Dave Jiang 2022-12-05  104  		input.wr_bw = cpu_to_le32(dent->coord.write_bandwidth);
6f49d1fab777d2 Dave Jiang 2022-12-05  105  
6f49d1fab777d2 Dave Jiang 2022-12-05  106  		qos_class = cxl_root->ops->get_qos_class(root_port, &input);
6f49d1fab777d2 Dave Jiang 2022-12-05  107  		if (qos_class < 0)
6f49d1fab777d2 Dave Jiang 2022-12-05  108  			continue;
6f49d1fab777d2 Dave Jiang 2022-12-05  109  
6f49d1fab777d2 Dave Jiang 2022-12-05  110  		dent->qos_class = qos_class;
6f49d1fab777d2 Dave Jiang 2022-12-05  111  	}
6f49d1fab777d2 Dave Jiang 2022-12-05  112  
6f49d1fab777d2 Dave Jiang 2022-12-05  113  	return 0;
6f49d1fab777d2 Dave Jiang 2022-12-05  114  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

