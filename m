Received: from forwardcorp1c.mail.yandex.net (forwardcorp1c.mail.yandex.net [178.154.239.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E03EA8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 08:10:45 +0000 (UTC)
Received: from mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net [IPv6:2a02:6b8:c12:6284:0:640:e19:0])
	by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 73B3A5FBF5;
	Tue, 22 Aug 2023 11:09:12 +0300 (MSK)
Received: from [IPV6:2a02:6b8:82:604:f7ab:b25b:2f4e:2225] (unknown [2a02:6b8:82:604:f7ab:b25b:2f4e:2225])
	by mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id A9Ew2M1OmmI0-cjy0p2qI;
	Tue, 22 Aug 2023 11:09:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru; s=default;
	t=1692691751; bh=cfrCuihVdIjSSCX3tJvpKT0CUSE5WyBwGjjq0fXTL64=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=wdC+yzd1wdT4Q0wJXTyUbYGQAU+riYEF7Y7+c6AjdfgFFmN/ggbDz2vCp9N+558s1
	 p2YWad6f/Qk16sMlc/OG3pyE1pIvtJMUsluuyQqr/NzxhExoJSW/1peoDIlgiTEe2M
	 gCE9YDOkbjGAxvFB4Scu2x895ivPhRga1PDqUcxg=
Authentication-Results: mail-nwsmtp-smtp-corp-main-62.myt.yp-c.yandex.net; dkim=pass header.i=@yandex-team.ru
Message-ID: <aa7e2363-05de-8e7e-74f3-eb7f8b276bf6@yandex-team.ru>
Date: Tue, 22 Aug 2023 13:09:09 +0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [RESEND PATCH v2 2/2] PCI: implement custom llseek method for PCI
 resource entries in sysfs
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-kernel@vger.kernel.org
References: <20230821072956.114193-2-valesini@yandex-team.ru>
 <202308220648.wcmc5jWq-lkp@intel.com>
From: Valentin Sinitsyn <valesini@yandex-team.ru>
In-Reply-To: <202308220648.wcmc5jWq-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.08.2023 04:15, kernel test robot wrote:
> Hi Valentine,
> 
> kernel test robot noticed the following build errors:
Just realized that v3 doesn't really address this, will send the updated 
patch shortly.

Best,
Valentin
