Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B59C2CE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Aug 2023 19:21:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 051CBC433C7;
	Mon, 14 Aug 2023 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692040892;
	bh=+jNaOqW1WvsHJtPWmed6N/GL/3OPvxMELeJSEAQ5RQQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RXdP/ZyMkR03vWLg5bl6dSGha1Z9Bho10LT0Jvp2NUkA4M5iSIPyr9KIXoSw588Kz
	 NwsCPQwTrHPQZaAzMfk7fqJKuo0LsGzktNdhbtWFyZg+JUPWhUcnciTwyGhi9+f8yV
	 2ly1eoou8uwBTG67QOa5VlG9AVD1atRmo0y+CEczCvxpqNcp7jY4r48Qux9n+5cElg
	 /SKxLvEi3cBnmHCAKx5jKDwWXv2MN+2e80zo5e+UBLib/wB1DqnXCB2tjmhi5q6mRq
	 HyLySw5D/krJpoRhmKVASk+VGlXDpHvvtudSaZQ+ncqAoo8KJhE4SCCN+QQePzlR7m
	 7digbgFI/QLlQ==
Date: Mon, 14 Aug 2023 21:21:28 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: kernel test robot <lkp@intel.com>
cc: Bastien Nocera <hadess@hadess.net>, oe-kbuild-all@lists.linux.dev, 
    linux-input@vger.kernel.org
Subject: Re: [hid:for-6.6/steelseries 1/1] drivers/hid/hid-steelseries.c:378:12:
 sparse: sparse: symbol 'arctis_1_battery_request' was not declared. Should
 it be static?
In-Reply-To: <202308150123.SRaAiV75-lkp@intel.com>
Message-ID: <nycvar.YFH.7.76.2308142121060.14207@cbobk.fhfr.pm>
References: <202308150123.SRaAiV75-lkp@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Aug 2023, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-6.6/steelseries
> head:   a0c76896c3fbdc2e7c70b980b3bb38a6ac445971
> commit: a0c76896c3fbdc2e7c70b980b3bb38a6ac445971 [1/1] HID: steelseries: Add support for Arctis 1 XBox
> config: i386-randconfig-i061-20230814 (https://download.01.org/0day-ci/archive/20230815/202308150123.SRaAiV75-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150123.SRaAiV75-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308150123.SRaAiV75-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> drivers/hid/hid-steelseries.c:378:12: sparse: sparse: symbol 'arctis_1_battery_request' was not declared. Should it be static?

Just pushed the patch below to hid.git as a fixup.

Thanks.

From: Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH] HID: steelseries: arctis_1_battery_request[] should be static

arctis_1_battery_request[] is not used outside of this module, and as such 
should be static.

Fixes: a0c76896c3fbdc2 ("HID: steelseries: Add support for Arctis 1 XBox")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
---
 drivers/hid/hid-steelseries.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 495377686123..43d2cf7153d7 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -375,7 +375,7 @@ static void steelseries_srws1_remove(struct hid_device *hdev)
 #define STEELSERIES_HEADSET_BATTERY_TIMEOUT_MS	3000
 
 #define ARCTIS_1_BATTERY_RESPONSE_LEN		8
-const char arctis_1_battery_request[] = { 0x06, 0x12 };
+static const char arctis_1_battery_request[] = { 0x06, 0x12 };
 
 static int steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
 {

-- 
Jiri Kosina
SUSE Labs

