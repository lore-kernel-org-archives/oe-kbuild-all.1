Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B67A18C31
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Sep 2024 17:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725901227; cv=none; b=AptzgWsImf+vmbX0178DbcseFoGOoNpx/V4cXyNk3Yn9CYs9J4IYBq/Vp+X3SK5O6u06DfKiA8c2TcSdjgHrluGB3IOqfbvsxiANMR0wvaKnw87F1F2rO9GfdOgpC6huk62ZipJ6URQIY2coI4fN9f1WMtl7k9v7gR1qHebHW4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725901227; c=relaxed/simple;
	bh=tlmU/tOU3qiMsZZf6YhxvWytNOspC7l+Y2v6pAuKUgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CxijQFSWYWYrjmrLfh5tt07ZKWcekg5ZK1URyvVFPN0TwTddaP/7OsWYsMBgs+fYpbcamWePhogAWBjmGWKKjOaHzVv/Gdx9JmBWOiiAPgC7qfLzKgEAtJbSooK1vWgGJjPFSXwfQr5eZtw2UnR4ZTQX6VnwWtp47AXJT0dDL+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=oOCPlvXf; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="oOCPlvXf"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4X2Y495fjBzlgTWQ;
	Mon,  9 Sep 2024 17:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1725901223; x=1728493224; bh=aXk9aM+ZEAlmd0CZx0uK//H4
	E51fVrhOBRVAQSwyD+E=; b=oOCPlvXfMoCYkcDsc+8f/qWPjELV6z1ei2dju0MD
	zt2L58TWX84dw8kqBcrtlQN4cscJzNhqKLs13FEhXX3Wrh0jc9DTGOs3zWsKoSqY
	lnEZ4LeL+Qad8GesZh/bRDa2VnVj66XoINJcEHflOmSEgkpsFk4SKMIKCXrqarLq
	8X99xHgjattS5ncTi3K0dEbCYj8OUfPsuUI660du2yrWXugiynZOLRSL9O6Z6d45
	KqIFiDQ5givmoU53xBG7a9xejSy8DWC11Cic4vVQYp0C+8NV6/0OUHFDeUDiaPu/
	jX8IQt2g2SfATjt7tnA256zrBiuJYF2ARfs/bdaiL7bLsA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 0_Lv_iftBTLd; Mon,  9 Sep 2024 17:00:23 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4X2Y466PG1zlgTWP;
	Mon,  9 Sep 2024 17:00:22 +0000 (UTC)
Message-ID: <e7dada44-c205-454e-8f49-52dd55017758@acm.org>
Date: Mon, 9 Sep 2024 10:00:21 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bvanassche:usb 3/3] drivers/usb/roles/class.c:39:31: error:
 duplicate member 'key'
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, Amit Sunil Dhamne <amitsd@google.com>,
 kernel test robot <lkp@intel.com>
References: <202409081825.OlP6X3uN-lkp@intel.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <202409081825.OlP6X3uN-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/24 3:47 AM, kernel test robot wrote:
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  22
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  23  struct usb_role_switch {
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  24  	struct device dev;
> fe1d1701ee563a drivers/usb/roles/class.c  Bart Van Assche   2024-09-04  25  	struct lock_class_key key;
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  26  	struct mutex lock; /* device lock*/
> 1c9be13846c0b2 drivers/usb/roles/class.c  Xu Yang           2024-01-29  27  	struct module *module; /* the module this device depends on */
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  28  	enum usb_role role;
> b787a3e7817590 drivers/usb/roles/class.c  Xu Yang           2024-01-29  29  	bool registered;
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  30
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  31  	/* From descriptor */
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  32  	struct device *usb2_port;
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  33  	struct device *usb3_port;
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  34  	struct device *udc;
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  35  	usb_role_switch_set_t set;
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  36  	usb_role_switch_get_t get;
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  37  	bool allow_userspace_control;
> fc88bb11617978 drivers/usb/roles/class.c  Amit Sunil Dhamne 2024-08-22  38
> fc88bb11617978 drivers/usb/roles/class.c  Amit Sunil Dhamne 2024-08-22 @39  	struct lock_class_key key;
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  40  };
> fde0aa6c175a4d drivers/usb/common/roles.c Heikki Krogerus   2018-03-20  41

Hi Greg,

Apparently Amit's patch is already in your for-next branch? Do you agree
with replacing Amit's patch with my patch series? See also
https://lore.kernel.org/linux-usb/CAHp75VeA6N_jmkz0-asjogYx4ig8Q=zxnNM7C4m5FV94pH-nCg@mail.gmail.com/
and
https://lore.kernel.org/linux-usb/20240906091308.GV4723@noisy.programming.kicks-ass.net/

Thanks,

Bart.

