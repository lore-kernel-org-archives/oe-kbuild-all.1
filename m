Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BC033F8BB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770827349; cv=none; b=s8y++TUvtnYEkHGAXSRfJc/Ryl2dttzevMu22rkSH/WRUFx4lkOmCk+aMkG2pie2qi4US8V3CTQNjXYCQjiBBPvT5/YjUxeM1tKd3ULj45HlQTRC9EF1BTolgPFe+U/FI31PWMZGaT+Qz2gVgixhvvAKlWoFH3CKmHSZLtp7Br8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770827349; c=relaxed/simple;
	bh=TpQXizAjyr02xQuCEm+MU+lS5e26G5Y5GzEEZYkLHDw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=neBzmW2tFTaPjZAJaPeCAMlm7hW8ywBc1S2RSogPGsBI21Z9toCsdJgxTPOx9MRMXHx9bNkZmbrJbwYkNdcSgM2ZdoTr32YG76I7cBjCYU0opXQSZHVSpt/g6xWFZIwzG32+UtwstESUCOSeBcohSE1cUnXeTkOK19rLx57tuHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id 139AF160486;
	Wed, 11 Feb 2026 16:28:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf11.hostedemail.com (Postfix) with ESMTPA id 04D4A2002F;
	Wed, 11 Feb 2026 16:28:50 +0000 (UTC)
Date: Wed, 11 Feb 2026 11:28:39 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, oe-kbuild-all@lists.linux.dev, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Tom Zanussi <zanussi@kernel.org>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] tracing: Fix checking of freed trace_event_file for
 hist files
Message-ID: <20260211112839.7fa369f3@fedora>
In-Reply-To: <202602110125.71oIfNm0-lkp@intel.com>
References: <20260210113427.1068932-2-petr.pavlu@suse.com>
	<202602110125.71oIfNm0-lkp@intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: cnaccx8ku8gcywammfdth6aqwubqwrm6
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 04D4A2002F
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18hw0/xsKlvvVJceZgqkAJ7+zo2kfLek+E=
X-HE-Tag: 1770827330-680173
X-HE-Meta: U2FsdGVkX18YXVbXegluWI42QkqAdLt8C9HfMP+DYNhh7ky9499jLfIG1agxGntvrGYZ2Aj0r75kOvOOrPucdA/PBrfxQk9XH2PV2o/48PhQaWg9SFPXkyKrHtlpe0i9NwdBAxi8jHaUBaX+ZTQzPoPD48WsyUIQlPuBdMOaVcfuGbgxnrN2P56RllGuUcD1oUTyJ7PzRSCdWWfS0fg5Mnl8Ytn4HaHo5ubha+lUfWBfIcFubr0uBkLM1vZ9Sbk6DY6D0/8eCNCJjYDk/V2kC5BosJXixs2d8QmrZjfEheKTyBkS8M0s9oTvJj/6MrZvxe9LKfBi+pabKh2hGwZcjyTiCrO249wu5vLlC2RC+gmeGogmy0wmThacZuh04AC+Q0VTYl2Zd1qq3ApoVrxjgn1Gu6Cmt3/YmIHkYyzcOC1fhK+J/71DR3cgN4nJWKuku0+CQF34LNIt8k43KjcGAedWkHad4lmA+weqBadPgJlhkvGpeC7N0aUN+0LYggek

On Wed, 11 Feb 2026 01:40:48 +0800
kernel test robot <lkp@intel.com> wrote:

> url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Pavlu/tracing-Fix-checking-of-freed-trace_event_file-for-hist-files/20260210-194023
> base:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
> patch link:    https://lore.kernel.org/r/20260210113427.1068932-2-petr.pavlu%40suse.com
> patch subject: [PATCH 1/5] tracing: Fix checking of freed trace_event_file for hist files
> config: x86_64-buildonly-randconfig-004-20260210 (https://download.01.org/0day-ci/archive/20260211/202602110125.71oIfNm0-lkp@intel.com/config)

CONFIG_FTRACE is not set, and histograms have this as a dependency.

> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110125.71oIfNm0-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602110125.71oIfNm0-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/trace/trace_events.c: In function 'remove_event_file_dir':
> >> kernel/trace/trace_events.c:1300:9: error: implicit declaration of function 'hist_poll_wakeup' [-Wimplicit-function-declaration]  
>     1300 |         hist_poll_wakeup();
>          |         ^~~~~~~~~~~~~~~~
> 

This needs:

diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
index 0a2b8229b999..8c627524c1d4 100644
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -683,6 +683,8 @@ static inline void hist_poll_wakeup(void)
 
 #define hist_poll_wait(file, wait)	\
 	poll_wait(file, &hist_poll_wq, wait)
+#else
+# define hist_poll_wait(file, wait) do{ } while (0)
 #endif
 
 #define __TRACE_EVENT_FLAGS(name, value)				\


-- Steve

