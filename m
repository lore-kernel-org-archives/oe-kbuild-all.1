Content-Type: multipart/mixed; boundary="===============1868588313305607840=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [peterz-queue:sched/core 8/8] lib/math/div64.c:194:1: warning: attribute declaration must precede definition
Date: Tue, 26 May 2020 21:34:20 +0200
Message-ID: <20200526193420.GE325280@hirez.programming.kicks-ass.net>
In-Reply-To: <CAKwvOdnRDbUXvfGsP9VX47nkuD3a8G_jWmGkH35cMcAATmgbvg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1868588313305607840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 09:53:47AM -0700, Nick Desaulniers wrote:

(I'll play with your other suggestions)

> Another question, how come the `__weak` definition of
> `mul_u64_u64_div_u64` doesn't follow the convention of the rest of
> lib/math/div64.c of using preprocessor guards?  Maybe that's more
> appropriate than `__weak` definitions?

Maybe I should; but Linus suggested using __weak, I suppose because he
don't like the CPP guards much.
--===============1868588313305607840==--

