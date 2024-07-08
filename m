Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC706143C47
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Jul 2024 15:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720454119; cv=none; b=cQsjNeWTUv/v1JzSlFErTD7r+hjt8Fdvgxn8Gx1DEvxKhW1eSgkYr3ZEAFnHucvr66nQeYyAkh9+qfW7rBHrJBcowkGttLAfYbcIcfxUtL/lhCSKDQBwNrwldNffU8XnmMnjFynEdRu3mSmry4P0a/U6Ayndieapt5wQ6Mlzr5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720454119; c=relaxed/simple;
	bh=cvBWKng3YeJPwbCLrAjHXr8nxo5lDxnqr7GqSHo/A44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IQFjEtGt6+Tqft7ZOJNAOM5K8YOdf3b0bCy23Qkro7MORUWpoujeY7/NhwMJudrkwAFpzxMCTpByqcczZ3WkaSlvCq6G/jDlfZ/PA07hNOIzt50VABTwvOKeDUn2UXieqa0+kRN+kGJSLfljzgjOEbhwDgkng4CJm1pD4b7qHk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l3MdqgeN; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l3MdqgeN"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-25e150603a6so2088566fac.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 08 Jul 2024 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720454116; x=1721058916; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BJuaMngDvL/ozTXoGo0oV92KGi7PV5ovmEPBZpZiQRY=;
        b=l3MdqgeNZCUehWZeHVcxTPlRaO65fJwARBaZvQT09mgICqza5FHgkUGb+f2+gDrvnB
         6Aypgwy8Yn+T8hZfInbl7lR9blKXpbE+tfChVuy5ZdUqfBPCaQUlV8LnGGsc3f/zW/1z
         1l/sfMm3qz3PaRhUusg5jjD3hT2yo61lLOY8VVfFgoGq7bnH8t39VlYE30sjcBkRVHFJ
         3jpOWDOUraCkUMgMncenKONULNstypr88uCeDL/nUViy4OIrK0GJSU+T8iNV1yotmAgh
         kMqg2SOSRQW7r6GJgR4rjhLFzykPbX8bPEN3ArrtXFvVrP9FE7MFVNRltaD1/zIGJsjo
         Tn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720454116; x=1721058916;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJuaMngDvL/ozTXoGo0oV92KGi7PV5ovmEPBZpZiQRY=;
        b=EKiafJjkmqvMeNgSSAvEpXX6u/Wqzrzh9RKoDoU7FLQyhKFAqPwpajKqtm6Ylvyf8D
         q9v7CokmwHM88O3bu6/58+7D6Dyj0fYx82sEUSoEdU28/9FieCK7hesrZhVI+7St+Mz5
         2T5vgkB10gCqR9U0Ryk7fhw5VAIaNImjrAIUEmQUSqqKEhvwPBA4O3vBl1plC2Y9ob2U
         G4Pgq8N3IV8bUgmaI1I3WIIToeiaca3ylxJ3IKQvEXqwO6K18+fJnSlNn4FX93jmakQV
         HVy1i0nNcPgL8ZCuClXBcI0WsGor1ePkOTuLdbBd+q/kRkxWF5Ol4SoGUCqBozcJo9m9
         cMLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCmFZF1j6bW0rM8YcKqj2g84dFBL7dwzepBvcDq45jwxozG2mNpBy2/dF55KI/TydCoV6dowm7MCHl6eyMcUZRs3+um1H/L/s9xj8Xnw==
X-Gm-Message-State: AOJu0Yy+nfn99oY3jGQyYFxbfwmVUbp0OH+dd36TRL4AexpkFo2PdGdT
	Uu3NbmyvhcFAoQAOr5f+Jjut7WvYmPTo0xaEMtSYm+kx4MLjGok777p6I7OAiXI=
X-Google-Smtp-Source: AGHT+IG6B3+NMl1Hiaxxb/+k2s6LmYwoH7OVJEFQUH5dePCXbN3KkTq+YCAQZ0+N/4FRlQumpJ6Ocw==
X-Received: by 2002:a05:6870:b50b:b0:25d:fab0:b6f3 with SMTP id 586e51a60fabf-25e2bf6358fmr9556896fac.59.1720454115970;
        Mon, 08 Jul 2024 08:55:15 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6fc:b7f5:4853:aff3])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25ea9feb5a5sm45381fac.19.2024.07.08.08.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 08:55:15 -0700 (PDT)
Date: Mon, 8 Jul 2024 17:55:13 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, yskelg@gmail.com,
	Harald Freudenberger <freude@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, shjy180909@gmail.com,
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
	Yunseong Kim <yskelg@gmail.com>
Subject: Re: [PATCH] s390/zcrypt: optimize memory allocation in online_show()
Message-ID: <ebe44c83-19bd-43e9-8999-99e3ccc7b417@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240623120147.35554-3-yskelg@gmail.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/yskelg-gmail-com/s390-zcrypt-optimize-memory-allocation-in-online_show/20240626-071004
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
patch link:    https://lore.kernel.org/r/20240623120147.35554-3-yskelg%40gmail.com
patch subject: [PATCH] s390/zcrypt: optimize memory allocation in online_show()
config: s390-randconfig-r081-20240707 (https://download.01.org/0day-ci/archive/20240707/202407071714.4AUEoeUD-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202407071714.4AUEoeUD-lkp@intel.com/

smatch warnings:
drivers/s390/crypto/zcrypt_card.c:103 online_store() warn: iterator used outside loop: 'zq'

vim +/zq +103 drivers/s390/crypto/zcrypt_card.c

ac2b96f351d7d2 Harald Freudenberger 2018-08-17   60  static ssize_t online_store(struct device *dev,
e28d2af43614eb Ingo Tuchscherer     2016-08-25   61  			    struct device_attribute *attr,
e28d2af43614eb Ingo Tuchscherer     2016-08-25   62  			    const char *buf, size_t count)
e28d2af43614eb Ingo Tuchscherer     2016-08-25   63  {
b5adbbf896d837 Julian Wiedmann      2021-06-07   64  	struct zcrypt_card *zc = dev_get_drvdata(dev);
4f2fcccdb547b0 Harald Freudenberger 2020-07-02   65  	struct ap_card *ac = to_ap_card(dev);
e28d2af43614eb Ingo Tuchscherer     2016-08-25   66  	struct zcrypt_queue *zq;
df6f508c68dbc6 Harald Freudenberger 2021-04-13   67  	int online, id, i = 0, maxzqs = 0;
df6f508c68dbc6 Harald Freudenberger 2021-04-13   68  	struct zcrypt_queue **zq_uelist = NULL;
e28d2af43614eb Ingo Tuchscherer     2016-08-25   69  
e28d2af43614eb Ingo Tuchscherer     2016-08-25   70  	if (sscanf(buf, "%d\n", &online) != 1 || online < 0 || online > 1)
e28d2af43614eb Ingo Tuchscherer     2016-08-25   71  		return -EINVAL;
e28d2af43614eb Ingo Tuchscherer     2016-08-25   72  
cfaef6516e9ac6 Ingo Franzki         2023-10-26   73  	if (online && (!ac->config || ac->chkstop))
4f2fcccdb547b0 Harald Freudenberger 2020-07-02   74  		return -ENODEV;
4f2fcccdb547b0 Harald Freudenberger 2020-07-02   75  
e28d2af43614eb Ingo Tuchscherer     2016-08-25   76  	zc->online = online;
e28d2af43614eb Ingo Tuchscherer     2016-08-25   77  	id = zc->card->id;
cccd85bfb7bf67 Harald Freudenberger 2016-11-24   78  
3f74eb5f78198a Harald Freudenberger 2021-10-15   79  	ZCRYPT_DBF_INFO("%s card=%02x online=%d\n", __func__, id, online);
cccd85bfb7bf67 Harald Freudenberger 2016-11-24   80  
df6f508c68dbc6 Harald Freudenberger 2021-04-13   81  	ap_send_online_uevent(&ac->ap_dev, online);
df6f508c68dbc6 Harald Freudenberger 2021-04-13   82  
e28d2af43614eb Ingo Tuchscherer     2016-08-25   83  	spin_lock(&zcrypt_list_lock);
df6f508c68dbc6 Harald Freudenberger 2021-04-13   84  	/*
df6f508c68dbc6 Harald Freudenberger 2021-04-13   85  	 * As we are in atomic context here, directly sending uevents
df6f508c68dbc6 Harald Freudenberger 2021-04-13   86  	 * does not work. So collect the zqueues in a dynamic array
df6f508c68dbc6 Harald Freudenberger 2021-04-13   87  	 * and process them after zcrypt_list_lock release. As we get/put
df6f508c68dbc6 Harald Freudenberger 2021-04-13   88  	 * the zqueue objects, we make sure they exist after lock release.
df6f508c68dbc6 Harald Freudenberger 2021-04-13   89  	 */
df6f508c68dbc6 Harald Freudenberger 2021-04-13   90  	list_for_each_entry(zq, &zc->zqueues, list)
2ff6be56a27c2d Yunseong Kim         2024-06-23   91  		if (!!zq->online != !!online)
df6f508c68dbc6 Harald Freudenberger 2021-04-13   92  			maxzqs++;
df6f508c68dbc6 Harald Freudenberger 2021-04-13   93  	if (maxzqs > 0)
2ff6be56a27c2d Yunseong Kim         2024-06-23   94  		zq_uelist = kcalloc(maxzqs, sizeof(*zq_uelist), GFP_ATOMIC);
e28d2af43614eb Ingo Tuchscherer     2016-08-25   95  	list_for_each_entry(zq, &zc->zqueues, list)
df6f508c68dbc6 Harald Freudenberger 2021-04-13   96  		if (zcrypt_queue_force_online(zq, online))
df6f508c68dbc6 Harald Freudenberger 2021-04-13   97  			if (zq_uelist) {
df6f508c68dbc6 Harald Freudenberger 2021-04-13   98  				zcrypt_queue_get(zq);
df6f508c68dbc6 Harald Freudenberger 2021-04-13   99  				zq_uelist[i++] = zq;
df6f508c68dbc6 Harald Freudenberger 2021-04-13  100  			}
e28d2af43614eb Ingo Tuchscherer     2016-08-25  101  	spin_unlock(&zcrypt_list_lock);
2ff6be56a27c2d Yunseong Kim         2024-06-23  102  	while (i--) {
df6f508c68dbc6 Harald Freudenberger 2021-04-13 @103  		ap_send_online_uevent(&zq->queue->ap_dev, online);
                                                                                       ^^
zq is an invalid pointer here.  It's an offset off the list head.
There used to be a "zq = zq_uelist[i];" before this function call but
the patch deleted it.

2ff6be56a27c2d Yunseong Kim         2024-06-23  104  		zcrypt_queue_put(zq_uelist[i]);
df6f508c68dbc6 Harald Freudenberger 2021-04-13  105  	}
df6f508c68dbc6 Harald Freudenberger 2021-04-13  106  	kfree(zq_uelist);
df6f508c68dbc6 Harald Freudenberger 2021-04-13  107  
e28d2af43614eb Ingo Tuchscherer     2016-08-25  108  	return count;
e28d2af43614eb Ingo Tuchscherer     2016-08-25  109  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

