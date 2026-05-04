Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBBF2288CB
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 21:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777930815; cv=none; b=RRI3X1H1Ui1eaHu+HfhIVlqVLt5U3DAnTJpKVRkvnumo9+K3/G/paxmYBhZ82jpFddsj3HzFZRC9gulZZlqwbKwezHoGhUUpusa4IDia+MnoUdHkcQevxAWWd9HFvq/SCDAyrNMjH2R02bE2AXz9/WhqVH6Do+ikXj4g9SfP/Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777930815; c=relaxed/simple;
	bh=F/7eaHTdfmk56NfMHR9t2oh5xL5h39jo8SLGRyou9Ew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hQBIby5QZSyKA1WC0m7q8/Z3vqrtQ6gra0yXvGZWCa1gG8yre3Vw6BDcckwxii8+UVjDj5FT9yahoNsF+3cvCIm/XmluzsjJCEoKOrDhCkXL/omGJRZAdCgro+rFH14/Iy39hI69FLej9ByWzJDfSerhRW943kSvR4wAE7ERzqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=M9CrW0j5; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="M9CrW0j5"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8eae9229110so774821585a.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 04 May 2026 14:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777930812; x=1778535612; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1SZv1da+lTeBTr41psnTZnxvD+AlAqGbOUvZi+EOYKk=;
        b=M9CrW0j5vLcQTBY0JqLbnKvMRaaJsZF1IsKIS4FlDZ7kkfwKmVBmY9KB6SGY1CqCXB
         bnOfUF+/tcGr0Bd6yBM5r3yTr7xCjC/tt/I1m2/8/xmOhM3gmP5LkHkgdJHtIANNCKwJ
         a1wETOu5cXz6ODeh9T3Z1++3yI63zKHuOVM0HNVgx633yPb+HqVv5GpEusxmRI01qc86
         UGuy5Ud1jHIdyatHionqUbchKrRym8jKx+aGYjz4IpM87LDcCo8+/rLRKKTcIi8wXCg9
         rqYpIc2WzKO/+Vuhg7Rubc6i4Yd/O/yQxlK6cPUbQrH0BPaOaMFWDpJlP+GYDc3NwZZA
         5YqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777930812; x=1778535612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SZv1da+lTeBTr41psnTZnxvD+AlAqGbOUvZi+EOYKk=;
        b=KcGqGx64jqVZvwxsgKCq4pZh+GscXpsL5Z/NLEw/QS6Ltv3YW4yHU4VFNPc5s4Ukg2
         p27sRWqDDHaXfFnSsoRmSALCUdr+vgKi75c7KKmbgtodYo2kkIZHl+0MgIWpKD425y5H
         JKZFNW9jLEKdCBC/ltECYDi6kIRgwDmAgMGxjYIiouXPabL4d43H/crk33x69Hrn8XLY
         ZNiUlaZ9mV8lkCyS1dk7STsWhxEAJJ7ztWWapCI23qndS7iim4aRhTHeH8umXbycpcME
         2B7vlzgh7H6+2FYg9b44goEgYYuAQJKMdYAvMMw19xE/28jhaMiECCuXuplNTzKYwKbx
         8csA==
X-Gm-Message-State: AOJu0YzDerTDg26K5ecBYpLu4YgsMzfQ6YMO4lF6tnyZFOsMdQYnP5eT
	G1I3zrJjwSMKqcm5mMMqEdzqJimf2sZjWi1ahYEYrHruZnDIOxhU4WcJNjvJJpkrVQM=
X-Gm-Gg: AeBDiesbhZ8kUNN0XfRvxdedyG5inXK3F67Up6zSOtENV/PA/Qq6fwMudNpLHCk4cJw
	YTmBL3R2uZk04iVVuOi4wR+14iJYEKyFx3bKIYw1iO0q2GbS/9ETVYBf7qBnN+rBNJpIOwXWSGN
	2PSGaMLBtMcY1XhbFtFUoaQ64+4Rr24appc/F8iP4sPSKGZbiCN2va7m+0hjulmrMv83TrcVEiX
	qA5U0pIXVEV4wr+FNOwonhHmpxlPdDVIfocp/RosW+Olh5Ubw4jhnkrLpPkHB8DsurtfWk/ZmzK
	QYSaRO/jdVhLWVPaqYQbvhXbq77YPwhQh7mKXpK8TYQM5RMc6pNA4COyVGgJHs2N5TdntMnWGHN
	1OxA0BLXDrJACycJAL3rA9l7CdUGdjgDeHzVx4378u93G8sdGJ0jPIrBaFLhbJyDEd0f7F7zpYY
	tTCoe634Ydc9EE6NuIOFXTmjtKYKzkigUcEMUj8/zx45HAGS1FhIBEswoBxexbgdvth5Ddmp2Ah
	A==
X-Received: by 2002:a05:620a:3195:b0:8cf:ffee:c616 with SMTP id af79cd13be357-902e48b88aemr125476185a.7.1777930812191;
        Mon, 04 May 2026 14:40:12 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c253c17sm1278837385a.30.2026.05.04.14.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2026 14:40:11 -0700 (PDT)
Message-ID: <5da3b012-80df-44aa-bd32-e5336a222899@riscstar.com>
Date: Mon, 4 May 2026 16:40:10 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [broonie-ci:spi-7.2 9/9] drivers/spi/spi-spacemit-k1.c:393:38:
 warning: integer overflow in expression of type 'long int' results in
 '-589934592'
To: Guodong Xu <guodong@riscstar.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
References: <202605050317.Tf9j487w-lkp@intel.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <202605050317.Tf9j487w-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/4/26 2:49 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git spi-7.2
> head:   efcd8b9d111177d48c841d09beca43b15d5b9e5f
> commit: efcd8b9d111177d48c841d09beca43b15d5b9e5f [9/9] spi: spacemit: introduce SpacemiT K1 SPI controller driver
> config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260505/202605050317.Tf9j487w-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050317.Tf9j487w-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605050317.Tf9j487w-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>     drivers/spi/spi-spacemit-k1.c: In function 'k1_spi_set_speed':
>>> drivers/spi/spi-spacemit-k1.c:393:38: warning: integer overflow in expression of type 'long int' results in '-589934592' [-Woverflow]
>       393 |         nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
>           |                                      ^
> 


Guodong, this and the hexagon overflow reported in a separate
e-mail is due to NSEC_PER_SEC being defined as a long (but not
64-bit) value.  The same fix addresses both.

BITS_PER_BYTE has no modifier so it's just an integer, and
drv_data->bytes is u32.  The result of multiplying the
first to two terms (1000000000L * 8) is 8000000000, which
cannot be expressed in 32 bits.

If you simply cast the first term there is no overflow:

     nsec_per_word = (u64)NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;

Could you please submit a correction to this (by which I
think you need to post v11 of the series).

Thanks.

					-Alex



> vim +393 drivers/spi/spi-spacemit-k1.c
> 
>     356	
>     357	/* Set the transfer speed; the SPI core code ensures it is supported */
>     358	static int k1_spi_set_speed(struct k1_spi_driver_data *drv_data,
>     359				    struct spi_transfer *transfer)
>     360	{
>     361		struct clk *clk = drv_data->clk;
>     362		u64 nsec_per_word;
>     363		u64 bus_ticks;
>     364		u32 timeout;
>     365		u32 val;
>     366		int ret;
>     367	
>     368		ret = clk_set_rate(clk, transfer->speed_hz);
>     369		if (ret)
>     370			return ret;
>     371	
>     372		drv_data->rate = clk_get_rate(clk);
>     373	
>     374		/* No need for RX FIFO timeout if we're not receiving anything */
>     375		if (!transfer->rx_buf)
>     376			return 0;
>     377	
>     378		/*
>     379		 * Compute the RX FIFO inactivity timeout value that should be used.
>     380		 * The inactivity timer restarts with each word that lands in the
>     381		 * FIFO.  If several "word transfer times" pass without any new data
>     382		 * in the RX FIFO, we might as well read what's there.
>     383		 *
>     384		 * The rate at which words land in the FIFO is determined by the
>     385		 * word size and the transfer rate.  One bit is transferred per
>     386		 * clock tick, and 8 (or 16 or 32) bits are transferred per word.
>     387		 *
>     388		 * So we can get word transfer time (in nanoseconds) from:
>     389		 *   nsec_per_tick = NSEC_PER_SEC / drv_data->rate;
>     390		 *   ticks_per_word = BITS_PER_BYTE * drv_data->bytes;
>     391		 * We do the divide last for better accuracy.
>     392		 */
>   > 393		nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
>     394		nsec_per_word = DIV_ROUND_UP_ULL(nsec_per_word, drv_data->rate);
>     395	
>     396		/*
>     397		 * The timeout (which we'll set to three word transfer times) is
>     398		 * expressed as a number of APB clock ticks.
>     399		 *   bus_ticks = 3 * nsec * (drv_data->bus_rate / NSEC_PER_SEC)
>     400		 */
>     401		bus_ticks = 3 * nsec_per_word * drv_data->bus_rate;
>     402		timeout = DIV_ROUND_UP_ULL(bus_ticks, NSEC_PER_SEC);
>     403	
>     404		/* Set the RX timeout period (required for both DMA and PIO) */
>     405		val = FIELD_PREP(SSP_TIMEOUT_MASK, timeout);
>     406		writel(val, drv_data->base + SSP_TIMEOUT);
>     407	
>     408		return 0;
>     409	}
>     410	
> 

