Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F98B19D896
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 10:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723546478; cv=none; b=Vsmq63+J+7tapkjm0/XagSJwJUdO1RiF+xgzUDEvCPqUHpEDp6Jbor0AcxuR828IlmXsnJx3Fq6V0gHu5+f1Se7IuWG9F9ewlFqda3WDBZHRMycpcXxRv6HMI4GeLyhvZ8maf++Kdb4NvDdsCPynlmH08vwSFwIqgN0Z71+2nZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723546478; c=relaxed/simple;
	bh=OxSYHQ3k5MjzUQ2Kutwve1hiA3tAnAe3bHK9jhDjvwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TFpji66Fc3+UINaRplkDaoMQmp2njhUuCOANvXlaDZs2E9BLGlh0/63DVR8lRCIr1DDxHXAcWJ1oqFWRdCe2ab0jdB7/VmNNaaT7rWM24IfQZve1VHsrXEpJKf8RGKdbFGGdDD1SCzBkVBEY6pgo1ubbcmlUOhFnAo4zFIvtHtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jxsc/rCZ; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jxsc/rCZ"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52ed741fe46so5732260e87.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Aug 2024 03:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723546475; x=1724151275; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2uxcA0AD21mlI5A0b2Azx/D2l1nIHZeC0kbwu7Pcoek=;
        b=Jxsc/rCZPxAtXnRi5Hra/wcihDNWELLly+0aSqUIMtOO3SLS8O4HmvJeDKnqOK/q5Z
         wfpDGSNRf5+oXV2QKCraZeVwoN4RfuLFRzAmrYSS56uI1CEbAJ0AfzWNF4a15uN2i86C
         WpgxMYN2Hsib4X6TI1zPAUjonhWFaexqLbfuMjih7Vgu6rXK8cBbsAQqQSlpW1PJhAcd
         bfyEPJtdmwUO+YF0OCZmVb5vEhmEVUQAa+wT/6XwKXAWWTLOikoxwEdMThli6i1QQ2qe
         iZsLPY56c1UN/bPfrHt8tt184rcXmWnInmz7kWE1KvExfGaf4SHKiFfMbEARWlhQka2V
         qc3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723546475; x=1724151275;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2uxcA0AD21mlI5A0b2Azx/D2l1nIHZeC0kbwu7Pcoek=;
        b=EUSiR2aqYZdUMieSYx6guDAcorqz2abFwFzLNRB9SmV6LgPnr9eR8OEKd2YY5BAuZ6
         0gmJ643wi5ltLwf6MybKcwMToJregjkMTEKObJe0UjAV9d+3DEmrJffXoDBVz60EWHCC
         TYBCR8XXOBrytH8+i/pHSiOIbEiyg1wgGkorLdbEExzW4oMZjR2fe1XaWAoI6z/aN9eK
         OrsOJsqF5oKI4Y50WZs4HS5/z2vLjkquGvjKdIMBeH/SGAbOGHYufgr89UVJawcvdE15
         RD8fYYCZq551SJflFJyMKD9H1psSFGCR2tCSGajpVsdUHwXa+Y0e72a7KGZbOFeZPOan
         2XtA==
X-Forwarded-Encrypted: i=1; AJvYcCXyM5V08sYYLiQXWzsg59dkI79e4KZUk3jADKDtDSGfbkoUZ0C0Jxspw38qFHNe9x7T24d3qq82dDdrA+vwupluhE/PLqYlSkakbk9rqw==
X-Gm-Message-State: AOJu0YyXzw3VbAw5G6z1rF2L5Up/ZkxnsF+irBZS0GTR3oB5bNFF5fkj
	QPMbwPyfh4DwBvSlpYCBrFCxSFxc+aVxO91RKIuZr0EkQONxrutckqQff54YoNU=
X-Google-Smtp-Source: AGHT+IEt33KE3orqV3uB6caCdjg6Dg49Jsi6CyRKWP1vfnIcMLZXn4bx+hwBYEO9vTlgn+XtJeZWLg==
X-Received: by 2002:a05:6512:104c:b0:52c:9383:4c16 with SMTP id 2adb3069b0e04-532136560d9mr1930940e87.22.1723546474410;
        Tue, 13 Aug 2024 03:54:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f121fdsm987686e87.179.2024.08.13.03.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 03:54:33 -0700 (PDT)
Date: Tue, 13 Aug 2024 13:54:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Chiara Meiohas <cmeiohas@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 26/38] drivers/infiniband/core/nldev.c:2822
 rdma_nl_notify_event() warn: missing error code 'ret'
Message-ID: <143efb4b-17a6-4ca3-996d-cb558c229cf3@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   2419f9d40091e6e94334b3c8df16d266133ddaea
commit: a4499d4d93fbda92878d7d2aba9e209e110f7756 [26/38] RDMA/nldev: Add support for RDMA monitoring
config: i386-randconfig-141-20240813 (https://download.01.org/0day-ci/archive/20240813/202408131838.dAj6f4Cl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408131838.dAj6f4Cl-lkp@intel.com/

smatch warnings:
drivers/infiniband/core/nldev.c:2822 rdma_nl_notify_event() warn: missing error code 'ret'

vim +/ret +2822 drivers/infiniband/core/nldev.c

a4499d4d93fbda Chiara Meiohas 2024-07-25  2788  int rdma_nl_notify_event(struct ib_device *device, u32 port_num,
a4499d4d93fbda Chiara Meiohas 2024-07-25  2789  			  enum rdma_nl_notify_event_type type)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2790  {
a4499d4d93fbda Chiara Meiohas 2024-07-25  2791  	struct sk_buff *skb;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2792  	struct net *net;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2793  	int ret = 0;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2794  	void *nlh;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2795  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2796  	net = read_pnet(&device->coredev.rdma_net);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2797  	if (!net)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2798  		return -EINVAL;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2799  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2800  	skb = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2801  	if (!skb)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2802  		return -ENOMEM;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2803  	nlh = nlmsg_put(skb, 0, 0,
a4499d4d93fbda Chiara Meiohas 2024-07-25  2804  			RDMA_NL_GET_TYPE(RDMA_NL_NLDEV, RDMA_NLDEV_CMD_MONITOR),
a4499d4d93fbda Chiara Meiohas 2024-07-25  2805  			0, 0);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2806  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2807  	switch (type) {
a4499d4d93fbda Chiara Meiohas 2024-07-25  2808  	case RDMA_REGISTER_EVENT:
a4499d4d93fbda Chiara Meiohas 2024-07-25  2809  	case RDMA_UNREGISTER_EVENT:
a4499d4d93fbda Chiara Meiohas 2024-07-25  2810  		ret = fill_mon_register(skb, device, net);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2811  		if (ret)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2812  			goto err_free;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2813  		break;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2814  	case RDMA_NETDEV_ATTACH_EVENT:
a4499d4d93fbda Chiara Meiohas 2024-07-25  2815  	case RDMA_NETDEV_DETACH_EVENT:
a4499d4d93fbda Chiara Meiohas 2024-07-25  2816  		ret = fill_mon_netdev_association(skb, device,
a4499d4d93fbda Chiara Meiohas 2024-07-25  2817  						  port_num, net);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2818  		if (ret)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2819  			goto err_free;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2820  		break;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2821  	default:
a4499d4d93fbda Chiara Meiohas 2024-07-25 @2822  		goto err_free;

I don't know what magic Smatch is using to say that this is an error path but it
feels right.

a4499d4d93fbda Chiara Meiohas 2024-07-25  2823  	}
a4499d4d93fbda Chiara Meiohas 2024-07-25  2824  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2825  	ret = nla_put_u8(skb, RDMA_NLDEV_ATTR_EVENT_TYPE, type);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2826  	if (ret)
a4499d4d93fbda Chiara Meiohas 2024-07-25  2827  		goto err_free;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2828  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2829  	nlmsg_end(skb, nlh);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2830  	ret = rdma_nl_multicast(net, skb, RDMA_NL_GROUP_NOTIFY, GFP_KERNEL);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2831  	if (ret && ret != -ESRCH) {
a4499d4d93fbda Chiara Meiohas 2024-07-25  2832  		skb = NULL; /* skb is freed in the netlink send-op handling */
a4499d4d93fbda Chiara Meiohas 2024-07-25  2833  		goto err_free;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2834  	}
a4499d4d93fbda Chiara Meiohas 2024-07-25  2835  	return 0;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2836  
a4499d4d93fbda Chiara Meiohas 2024-07-25  2837  err_free:
a4499d4d93fbda Chiara Meiohas 2024-07-25  2838  	rdma_nl_notify_err_msg(device, port_num, type);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2839  	nlmsg_free(skb);
a4499d4d93fbda Chiara Meiohas 2024-07-25  2840  	return ret;
a4499d4d93fbda Chiara Meiohas 2024-07-25  2841  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

