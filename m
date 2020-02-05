Content-Type: multipart/mixed; boundary="===============5697617060276677824=="
MIME-Version: 1.0
From: SeongJae Park <sj38.park@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 10/11] mm/damon: Add kunit tests
Date: Wed, 05 Feb 2020 17:47:09 +0100
Message-ID: <20200205164709.19920-1-sj38.park@gmail.com>
In-Reply-To: <202002051834.cKoViGVl%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5697617060276677824==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 5 Feb 2020 18:38:48 +0800 kbuild test robot <lkp@intel.com> wrote:

> [-- Attachment #1: Type: text/plain, Size: 24012 bytes --]
> =

> Hi,
> =

> Thank you for the patch! Perhaps something to improve:
> =

> [auto build test WARNING on linus/master]
> [also build test WARNING on v5.5]
> [cannot apply to next-20200205]
> [if your patch is applied to the wrong git tree, please drop us a note to=
 help
> improve the system. BTW, we also suggest to use '--base' option to specif=
y the
> base tree in git format-patch, please see https://stackoverflow.com/a/374=
06982]
> =

> url:    https://github.com/0day-ci/linux/commits/sj38-park-gmail-com/Intr=
oduce-Data-Access-MONitor-DAMON/20200204-143127
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t 322bf2d3446aabdaf5e8887775bd9ced80dbc0f0
> config: i386-allyesconfig (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=3Di386 =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    In file included from include/linux/list.h:9:0,
>                     from include/linux/random.h:10,
>                     from include/linux/damon.h:13,
>                     from mm/damon.c:14:
>    mm/damon-test.h: In function 'damon_test_str_to_pids':
>    include/linux/kernel.h:835:29: warning: comparison of distinct pointer=
 types lacks a cast
>       (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
>                                 ^
> >> include/kunit/test.h:510:9: note: in expansion of macro '__typecheck'
>      ((void)__typecheck(__left, __right));           \
>             ^~~~~~~~~~~
> >> include/kunit/test.h:534:2: note: in expansion of macro 'KUNIT_BASE_BI=
NARY_ASSERTION'
>      KUNIT_BASE_BINARY_ASSERTION(test,           \
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> include/kunit/test.h:623:2: note: in expansion of macro 'KUNIT_BASE_EQ=
_MSG_ASSERTION'
>      KUNIT_BASE_EQ_MSG_ASSERTION(test,           \
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> include/kunit/test.h:633:2: note: in expansion of macro 'KUNIT_BINARY_=
EQ_MSG_ASSERTION'
>      KUNIT_BINARY_EQ_MSG_ASSERTION(test,           \
>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >> include/kunit/test.h:996:2: note: in expansion of macro 'KUNIT_BINARY_=
EQ_ASSERTION'
>      KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
>      ^~~~~~~~~~~~~~~~~~~~~~~~~
> >> mm/damon-test.h:26:2: note: in expansion of macro 'KUNIT_EXPECT_EQ'
>      KUNIT_EXPECT_EQ(test, 1l, nr_integers);
>      ^~~~~~~~~~~~~~~
[...]

Thank you for the reporting!  Fixed the warnings and an error for i386 build
with below changes.  If anything wrong, please let me know.


Thanks,
SeongJae Park


diff --git a/mm/damon-test.h b/mm/damon-test.h
index ad3ffd1c20e2..c7dc21325c77 100644
--- a/mm/damon-test.h
+++ b/mm/damon-test.h
@@ -23,51 +23,51 @@ static void damon_test_str_to_pids(struct kunit *test)

        question =3D "123";
        answers =3D str_to_pids(question, strnlen(question, 128), &nr_integ=
ers);
-       KUNIT_EXPECT_EQ(test, 1l, nr_integers);
+       KUNIT_EXPECT_EQ(test, (ssize_t)1, nr_integers);
        KUNIT_EXPECT_EQ(test, 123ul, answers[0]);
        kfree(answers);

        question =3D "123abc";
        answers =3D str_to_pids(question, strnlen(question, 128), &nr_integ=
ers);
-       KUNIT_EXPECT_EQ(test, 1l, nr_integers);
+       KUNIT_EXPECT_EQ(test, (ssize_t)1, nr_integers);
        KUNIT_EXPECT_EQ(test, 123ul, answers[0]);
        kfree(answers);

        question =3D "a123";
        answers =3D str_to_pids(question, strnlen(question, 128), &nr_integ=
ers);
-       KUNIT_EXPECT_EQ(test, 0l, nr_integers);
+       KUNIT_EXPECT_EQ(test, (ssize_t)0, nr_integers);
        KUNIT_EXPECT_PTR_EQ(test, answers, (unsigned long *)NULL);

        question =3D "12 35";
        answers =3D str_to_pids(question, strnlen(question, 128), &nr_integ=
ers);
-       KUNIT_EXPECT_EQ(test, 2l, nr_integers);
+       KUNIT_EXPECT_EQ(test, (ssize_t)2, nr_integers);
        for (i =3D 0; i < nr_integers; i++)
                KUNIT_EXPECT_EQ(test, expected[i], answers[i]);
        kfree(answers);

        question =3D "12 35 46";
        answers =3D str_to_pids(question, strnlen(question, 128), &nr_integ=
ers);
-       KUNIT_EXPECT_EQ(test, 3l, nr_integers);
+       KUNIT_EXPECT_EQ(test, (ssize_t)3, nr_integers);
        for (i =3D 0; i < nr_integers; i++)
                KUNIT_EXPECT_EQ(test, expected[i], answers[i]);
        kfree(answers);

        question =3D "12 35 abc 46";
        answers =3D str_to_pids(question, strnlen(question, 128), &nr_integ=
ers);
-       KUNIT_EXPECT_EQ(test, 2l, nr_integers);
+       KUNIT_EXPECT_EQ(test, (ssize_t)2, nr_integers);
        for (i =3D 0; i < 2; i++)
                KUNIT_EXPECT_EQ(test, expected[i], answers[i]);
        kfree(answers);

        question =3D "";
        answers =3D str_to_pids(question, strnlen(question, 128), &nr_integ=
ers);
-       KUNIT_EXPECT_EQ(test, 0l, nr_integers);
+       KUNIT_EXPECT_EQ(test, (ssize_t)0, nr_integers);
        KUNIT_EXPECT_PTR_EQ(test, (unsigned long *)NULL, answers);
        kfree(answers);

        question =3D "\n";
        answers =3D str_to_pids(question, strnlen(question, 128), &nr_integ=
ers);
-       KUNIT_EXPECT_EQ(test, 0l, nr_integers);
+       KUNIT_EXPECT_EQ(test, (ssize_t)0, nr_integers);
        KUNIT_EXPECT_PTR_EQ(test, (unsigned long *)NULL, answers);
        kfree(answers);
 }
diff --git a/mm/damon.c b/mm/damon.c
index 108476b07555..c6c5b975f1f5 100644
--- a/mm/damon.c
+++ b/mm/damon.c
@@ -509,8 +509,8 @@ static bool damon_check_reset_time_interval(struct time=
spec64 *baseline,
        struct timespec64 now;

        ktime_get_coarse_ts64(&now);
-       if ((timespec64_to_ns(&now) - timespec64_to_ns(baseline)) / 1000 <
-                       interval)
+       if ((timespec64_to_ns(&now) - timespec64_to_ns(baseline)) <
+                       interval * 1000)
                return false;
        *baseline =3D now;
        return true;

> =

> ---
> 0-DAY kernel test infrastructure                 Open Source Technology C=
enter
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corp=
oration
> =

> [-- Attachment #2: .config.gz --]
> [-- Type: application/gzip, Size: 71233 bytes --]
--===============5697617060276677824==--

