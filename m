Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540121863
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 09:19:47 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id u9so377646plf.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 03 Feb 2023 01:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B/K5nwMA8gvVa10PeMZSw77e4QnQnF6l8GwdE0FA3W4=;
        b=luBjfbvqSaQ7qCAtGVFiqUWy8FH5HsgUOP8afdGlDZAq+nE0K4nyTcB+gtX8x2nCs5
         /NBt9Kzh0EJeREIj7zfZ64jlel4aobpLlESPqAxQKaU5zr3heb1V4UciwZcbGrmlkI/a
         TSIZRo51WZ77BufXUtTZ1FACt665zphwXLclJHSripRXRenn9DRJW5eHsECYU7DMafUI
         6F8ln1JwqcmNqtKmDeC/vOcT+SnT7ukwgEuUoe40aStBjojhXq6gvkvBiHySWwLHq4y5
         78hRysrNaQXBLo8eUfi3g8pjwHiX+YfCnuKvxSv1x+EY021w5mbIXJrwf/xRmxaI6gJq
         LOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/K5nwMA8gvVa10PeMZSw77e4QnQnF6l8GwdE0FA3W4=;
        b=MNVnmRTlZkzU+ydmW+F+E0HxpTavs8bVyMsmFfCgrFwuwe9c+bmhXPVkV7YvJCqI2u
         nfCcWo/KyVsXTZ2vBOcV7cm7ZRbMAYhedKmQ7mJRzvmCY7qiCrr6gAiCsJFsKjtChJ+A
         oK8uQi8h+Rqntz/1skiozZHHb7QrJD96kWO32ZBZrFEolY9NWodSikwmgYxdNAv58oDt
         AEFUtGhWzdaxeF7jl4lqNVtOWWs371wwqxv3gQ2o9Q/H1DFV+iXrSXuc/O5zTzLaU1Wm
         /DmIw8OIp0uezYGSiGTQeYJcG2dmzn2f+NnV1WePLMNj0eeod/wgg9OHi3wRDPaWkkjv
         nWVw==
X-Gm-Message-State: AO0yUKW5i6B09XJo7ozfn0DDYIksK9MmbWuZ6osW2RkPMc67dJ/67xC8
	LNERfGGxA+O6dpV4s51I7+Q=
X-Google-Smtp-Source: AK7set//VeLBQllO4lSM/GQi7Dl1r/947yKqKjU+0e76B/DeM4FjHh/tIjcVf6py4FWhAU1xPv7NZA==
X-Received: by 2002:a17:902:f2d4:b0:197:8f72:aed8 with SMTP id h20-20020a170902f2d400b001978f72aed8mr7116572plc.5.1675415986633;
        Fri, 03 Feb 2023 01:19:46 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-91.three.co.id. [180.214.233.91])
        by smtp.gmail.com with ESMTPSA id z3-20020a170902ee0300b001960441f604sm1084907plb.277.2023.02.03.01.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 01:19:46 -0800 (PST)
Message-ID: <7370dc9a-8a14-4c38-028e-f44cd099dbaf@gmail.com>
Date: Fri, 3 Feb 2023 16:19:41 +0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] tracing/histogram: Wrap remaining shell snippets in code
 blocks
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
Cc: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, kernel test robot <lkp@intel.com>
References: <202301290253.LU5yIxcJ-lkp@intel.com>
 <20230129031402.47420-1-bagasdotme@gmail.com> <871qn8vsro.fsf@meer.lwn.net>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <871qn8vsro.fsf@meer.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/3/23 01:14, Jonathan Corbet wrote:
> So this is a good cleanup and I'd like to apply it, but it doesn't come
> close to applying to docs-next.  Which tree did you do this against?
> 

for-next branch (linux-trace tree).

-- 
An old man doll... just what I always wanted! - Clara

