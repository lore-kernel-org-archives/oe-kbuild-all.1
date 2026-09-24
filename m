Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F373624C5;
	Thu, 24 Sep 2026 18:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790274691; cv=none; b=WxtetniyZELQFayG44bzUMWgiEU0iiO4tT4jilLUaaQyD5I3Xj+74f4DoT8Lv2JmuR6JDeGA6smzleuNYIUoHySTYp5bI/p9W/N6nIFB4dRg12BJHcBmk0GL3SSjwLq6Rx9sqzK31d4u3dDZBDMzCa5vQGrv0t9/irRqCteguOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790274691; c=relaxed/simple;
	bh=vASZjPdVJmL9BLZZqe/CHwFQYeytSOrKeWPeOZFz8f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwZLXTLVE+bJbKe5OkmYwtd4uzI7VdBCdU1HrgFlVHjn9GybtsBTWUhZLXJPecGMiz5rlzSvfnJLYJ99V9C+QaH3nHUQpF0DEd2NR0lA4GecoKzS0/BJvtB4UtaY/dL7/nnSXSDqPBt6j4zhcv9BZt1TFtklyS7tuxYPgr+JjIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=W0pLEx3u; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="W0pLEx3u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0h0IbeNOqSvjcEi0qrU0qL+dUPVCSJzkXIt2pRUFlqE=; b=W0pLEx3uhlcpodgm9jhmgh+zZ/
	nuKO9Uf51qVsl8Q63c8ThGSPbyIdZqF28Fmg9ESRQl8X1lFl6SJWFYkFjTyvq6xChVJqAGKNTdcH/
	Vg1OLBsVCnJ1kEi/DNVHu6vq8tgr9+1MCuEs+tgaTvmvMZqL7dv/8Ojkb84ydLNuh+o73zfPOGUjv
	fFBAafQjz3/4/WBYmqQ/j8/2X/IXpZNWGvaHOR1RC1z8vrbTEXcrteClkuao1aYj0uJb6AgGhkxUu
	Q+W2GmzFCnOGr4/QKu9ZHuOBW2NXiKG7swZy9U3tFZu64ooNp1SvmK1caV/yUZYcxmK47jvyLofb1
	DA7ZljyA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9oE6-0000000BuTX-45IR;
	Thu, 24 Sep 2026 18:31:23 +0000
Message-ID: <853fd4a2-e3c3-46cb-844e-57f0002f86c8@infradead.org>
Date: Thu, 24 Sep 2026 11:31:21 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5111/5916] htmldocs:
 Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline
 emphasis start-string without end-string. [docutils]
To: Waqar Hameed <waqar.hameed@axis.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
References: <202609110722.GAZVme6v-lkp@intel.com> <pndse3cp5s6.a.out@axis.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <pndse3cp5s6.a.out@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/14/26 1:59 AM, Waqar Hameed wrote:
> On Fri, Sep 11, 2026 at 07:40 +0200 kernel test robot <lkp@intel.com> wrote:
> 
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   f2bfbc3554ca6919484030729424b9dee2942d24
>> commit: cb012fe405f0f487e9480472f3558e678556ed49 [5111/5916] power: supply: rt9471: Use POWER_SUPPLY_PROP_LOAD_SWITCH
>> compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
>> docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
>> reproduce: (https://download.01.org/0day-ci/archive/20260911/202609110722.GAZVme6v-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202609110722.GAZVme6v-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>    Using alabaster theme
>>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:364; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:234
>>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/os_mode_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:373; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:243
>>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:636; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:252
>>    WARNING: /sys/bus/usb/devices/<busnum>-<devnum>:<config num>.<interface num>/<hid-bus>:<vendor-id>:<product-id>.<num>/touchpad/enabled_index is defined 2 times: Documentation/ABI/testing/sysfs-driver-hid-lenovo-go:645; Documentation/ABI/testing/sysfs-driver-hid-lenovo-go-s:261

>>>> Documentation/ABI/testing/sysfs-class-power-rt9471:1: WARNING: Inline emphasis start-string without end-string. [docutils]
> 
> [...]
> 
> I actually saw this in when working in [1]. Since this was present in
> many different files in `Documentation/ABI/testing/sysfs-class-power*`,
> I just assumed this was known and therefore deliberately ignored. Is
> that your view as well Sebastian? Otherwise, I can easily clean this up
> and make it correct once for all...
> 
> [1] https://lore.kernel.org/lkml/cover.1788290289.git.waqar.hameed@axis.com/

Please fix it (the warning in sysfs-class-power-rt9471).
I don't see warnings from any other sysfs-class-power* files.

thanks.
-- 
~Randy

