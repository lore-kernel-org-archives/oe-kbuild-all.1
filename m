Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6ED264FB7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740474185; cv=none; b=LRXPxoNdjMMJUECNTBYzLvev6GSt7CMs0JZUhCK4v9nL/JFcETTyTTJ/OL+kPBJtWCOVKDgfqIobJPjmIQ1ERqTMJmsQgEUaBpETiXhBzripdF75bhz/xcJn56YPuWgUEsyFjuF6MUBmhctvrbM6iBvcoINKfDtnOalr3ZfICEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740474185; c=relaxed/simple;
	bh=n0EB057seNvA9h3/NN3MByUeOXkUJbArTd7T60aSt1M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UXov7An2Zu36na5HqFOn8SxodIPe8oJ/K3ScikXDckSQj1wml3Z1yLMGtgqyMkBioxfVP10NAjBKOAGtRudcqTs8I/VOw1m47iVYlFA/pvDFFQU1vzjhRv3oIOIsZvsJLp8K3fplQ5/uNswY9HCIk5tLv5v2wag2zRM7PY8l97Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=na1lVs70; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="na1lVs70"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-439a4dec9d5so50748395e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Feb 2025 01:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740474181; x=1741078981; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gKgYZYADACy30IaCXExUX8oou2qy9v1ws6O1re1moBk=;
        b=na1lVs70X9ndwIKZw8pyty/WxG0A5MQnr65ioMxhO2sCtzlVEZ9kJ3k0/oWkqyagOQ
         9KlMyAfymWo1J0e8TwlkzHz/oNsP/VDIEifQbVRW2YZUoUJ1fIwH6X0MwInkcvMiV7sF
         3PRJZGUi9G39xH8FMBYApqjcShXt162bla7XvqoyVm3yOjdhsRUV1X0HFdmLeoWEA3eT
         V9JftKHEJHlt096xzVhGZ8GW6TFrAQzmwrp2EIjbb8wUX0Kh3RqLWkM7bt42NAk1T6JJ
         U/X75TVk06O0LJuAIDU/tBQBom06XM75Dvq4CngaGtbEhf/d9Hj5v5pLJDK/4z9DMUhb
         x5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474181; x=1741078981;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gKgYZYADACy30IaCXExUX8oou2qy9v1ws6O1re1moBk=;
        b=VJRpNLKybt94Y+QNvmM8zZXnoDjE35t2yMFAB9srAW+xYqMo9YHZMXpvQLd+17CS3+
         skXKVdTiRxUYPDZt/C7O1luTqls8HjU42AoCkmuzVYWJP3IvLp6aNYhUh95/pF8IPHvs
         DivllXrlAcZI6eYxqnae3a/gLhb+4BC7W+7gVkY91xkeJEyvkHPfI2UTNn5zaAltrdF2
         /ZjeyV+roWgYqL1M95TMwChjsFLIO3K7d4+zh6TPk5JXFN1mXvk0nGAfBTBFNJ3/DyjS
         bQwZx1VM2AIYV75f9UXz5ZL7pBqSIXchL4pEpBm3b4Bh2yfkjwGMmSpxsU6cN0WBMhgO
         tGug==
X-Forwarded-Encrypted: i=1; AJvYcCXbpo5r6n/XkBec4nVIffVmXmCls8XpqMnFqqVDyMYC+3QlgUbDjNvkMcqGhoIBqV0QuHn1/IzQgBp1VBPq@lists.linux.dev
X-Gm-Message-State: AOJu0Yx62jMF0Lz8xTYU71A9/b4XaVA43hl32b+EgVWDDTGTkBtcJcO/
	TDFisu/Vr8eXJaslh/5nEwF7z/Rj4600Sgl3Nrtd/3xwS+8JTYiQ1UncJxipA9w=
X-Gm-Gg: ASbGncuDiuvXOL8bs8M9T36XD7dFrYEbh8+nd3WZ2kKpQuUszwrjIip4EloXM75TORZ
	N1Yp7mMoeMhg1GP8a4WsWFCdDIsAJOgQlb9/esn4WPOaVyh/eYz7b5FE7QTQmQBQ7ZhqpUKTow6
	nLeelSWryJXW5U9WGqzaGhVc6I5hELWdOQrxGWV6KmQThM8QRukjBuYXVLYmQ78n183mpTiWAGY
	tAjBWIHJCTrvWU7Snz6Nfrb2tNaG+tIRafRe+boL0BapTFZsplIoJ+VIE26cWWkWEaU+vKJaz0Y
	VM6ym4ZpYX73OhGC8N7JpXtkMxzmdeI=
X-Google-Smtp-Source: AGHT+IFUbXvRXDMa+0e5ZJNCJLdb+utkR88zcXej3+sO/Z2lWVOMV8zrridYLa+k7OHlaVrN36mAiw==
X-Received: by 2002:a05:6000:18a2:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-390cc631b3bmr1701013f8f.37.1740474180499;
        Tue, 25 Feb 2025 01:03:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed1d54a0dsm107879866b.50.2025.02.25.01.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 01:02:59 -0800 (PST)
Date: Tue, 25 Feb 2025 12:02:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3] Bluetooth: hci_core: Enable buffer flow control for
 SCO/eSCO
Message-ID: <7829aa4b-54fb-427f-ab3c-fbb90ea7588f@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221204916.2217628-1-luiz.dentz@gmail.com>

Hi Luiz,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-hci_core-Enable-buffer-flow-control-for-SCO-eSCO/20250222-045019
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20250221204916.2217628-1-luiz.dentz%40gmail.com
patch subject: [PATCH v3] Bluetooth: hci_core: Enable buffer flow control for SCO/eSCO
config: i386-randconfig-141-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231103.loPGnZml-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502231103.loPGnZml-lkp@intel.com/

New smatch warnings:
net/bluetooth/hci_core.c:3583 hci_sched_sco() error: uninitialized symbol 'conn'.
net/bluetooth/hci_core.c:3583 hci_sched_sco() error: we previously assumed 'conn' could be null (see line 3562)
net/bluetooth/hci_core.c:3621 hci_sched_esco() error: uninitialized symbol 'conn'.
net/bluetooth/hci_core.c:3621 hci_sched_esco() error: we previously assumed 'conn' could be null (see line 3599)

Old smatch warnings:
net/bluetooth/hci_core.c:2595 hci_register_dev() warn: 'hdev->rfkill' is an error pointer or valid

vim +/conn +3583 net/bluetooth/hci_core.c

7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3551  static void hci_sched_sco(struct hci_dev *hdev)
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3552  {
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3553  	struct hci_conn *conn;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3554  	struct sk_buff *skb;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3555  	int quote;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3556  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3557  	BT_DBG("%s", hdev->name);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3558  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3559  	if (!hci_conn_num(hdev, SCO_LINK))
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3560  		return;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3561  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23 @3562  	while (hdev->sco_cnt && (conn = hci_low_sent(hdev, SCO_LINK, &quote))) {

Can hdev->sco_cnt be zero at the start?  That would make "conn"
uninitialized.  This loop can exit with conn set to NULL.

7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3563  		while (quote-- && (skb = skb_dequeue(&conn->data_q))) {
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3564  			BT_DBG("skb %p len %d", skb, skb->len);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3565  			hci_send_frame(hdev, skb);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3566  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3567  			hdev->sco_cnt--;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3568  			conn->sent++;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3569  			if (conn->sent == ~0)
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3570  				conn->sent = 0;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3571  		}
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3572  	}
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3573  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3574  	/* Restore sco_cnt if flow control has not been enabled as
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3575  	 * HCI_EV_NUM_COMP_PKTS won't be generated.
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3576  	 */
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3577  	if (!hci_dev_test_flag(hdev, HCI_SCO_FLOWCTL)) {
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3578  		hdev->sco_cnt = hdev->sco_pkts;
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3579  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3580  		/* As flow control is disabled force tx_work to run if there are
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3581  		 * still packets left in the queue.
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3582  		 */
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21 @3583  		if (!skb_queue_empty(&conn->data_q))
                                                                                              ^^^^

efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3584  			queue_work(hdev->workqueue, &hdev->tx_work);
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3585  	}
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3586  }
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3587  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3588  static void hci_sched_esco(struct hci_dev *hdev)
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3589  {
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3590  	struct hci_conn *conn;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3591  	struct sk_buff *skb;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3592  	int quote;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3593  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3594  	BT_DBG("%s", hdev->name);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3595  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3596  	if (!hci_conn_num(hdev, ESCO_LINK))
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3597  		return;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3598  
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23 @3599  	while (hdev->sco_cnt && (conn = hci_low_sent(hdev, ESCO_LINK,
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3600  						     &quote))) {
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3601  		while (quote-- && (skb = skb_dequeue(&conn->data_q))) {
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3602  			BT_DBG("skb %p len %d", skb, skb->len);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3603  			hci_send_frame(hdev, skb);
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3604  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3605  			hdev->sco_cnt--;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3606  			conn->sent++;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3607  			if (conn->sent == ~0)
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3608  				conn->sent = 0;
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3609  		}
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3610  	}
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3611  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3612  	/* Restore sco_cnt if flow control has not been enabled as
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3613  	 * HCI_EV_NUM_COMP_PKTS won't be generated.
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3614  	 */
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3615  	if (!hci_dev_test_flag(hdev, HCI_SCO_FLOWCTL)) {
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3616  		hdev->sco_cnt = hdev->sco_pkts;
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3617  
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3618  		/* As flow control is disabled force tx_work to run if there are
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3619  		 * still packets left in the queue.
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3620  		 */
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21 @3621  		if (!skb_queue_empty(&conn->data_q))
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3622  			queue_work(hdev->workqueue, &hdev->tx_work);
efee7ae7cd85cf7 Luiz Augusto von Dentz 2025-02-21  3623  	}
7fedd3bb6b77f9b Abhishek Pandit-Subedi 2020-03-23  3624  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

